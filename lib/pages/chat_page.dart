import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

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
                itemBuilder: (_, i) => Text("$i"),
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
                child: const Text('Enviar'), 
                onPressed: (){}
              ) : Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.send, color: Colors.blue.shade400)
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
  }
}