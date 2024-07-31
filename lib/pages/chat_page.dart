import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/chat_message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  bool _estaEscribiendo = false;

  final List<ChatMessage> _messages = [
    const ChatMessage(uid: '123', texto: "Hola que tal"),
    const ChatMessage(uid: '124', texto: "Todo bien y tu?"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              child: Text("Ya", style: TextStyle(fontSize: 12)),
              backgroundColor: Colors.blue.shade100,
            ),
            SizedBox(height: 3),
            Text("Yader Mejia", style: TextStyle(color: Colors.black87, fontSize: 14))
          ],
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _messages.length,
                itemBuilder: (_, i) => _messages[i],
                reverse: true
              )
            ),
            const Divider(height: 1),
            Container(
              color: Colors.white,
              child: _inputChat(),
            )
          ],
        ),
      )
    );
  }

  Widget _inputChat(){
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String texto){
                  setState(() {
                    if(texto.trim().length > 0){
                      _estaEscribiendo = true;
                    } else {
                      _estaEscribiendo = false;
                    }
                  });
                },
                decoration: const InputDecoration.collapsed(
                  hintText: "Enviar mensaje",
                ),
                focusNode: _focusNode,
              ) 
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS ? CupertinoButton(
                onPressed: _estaEscribiendo ? () => _handleSubmit(_textController.text.trim()) : null,
                child: const Text('Enviar'),
              ) : Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconTheme(
                  data: IconThemeData(color: Colors.blue.shade400),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onPressed: _estaEscribiendo ? () => _handleSubmit(_textController.text.trim()) : null, 
                    icon: const Icon(Icons.send)
                  ),
                ),
              ),
            )
          ],
        ),
      ) 
    );
  }

  _handleSubmit(String texto){
    _focusNode.requestFocus();
    _textController.clear();

    final newMessage = ChatMessage(uid: '123', texto: texto);
    _messages.insert(0, newMessage);

    setState(() {
      _estaEscribiendo = false;
    });
  }
}