import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';
import '../services/socket_service.dart';
import '../services/chat_service.dart';
import '../widgets/chat_message.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin{
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  bool _estaEscribiendo = false;

  final List<ChatMessage> _messages = [];

  ChatService? chatService;
  SocketService? socketService;
  AuthService? authService;

  @override
  void initState() {
    authService = Provider.of<AuthService>(context, listen: false);
    chatService = Provider.of<ChatService>(context, listen: false);
    socketService = Provider.of<SocketService>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final usuarioPara = chatService!.usuarioPara;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: Text(usuarioPara!.nombre.substring(0, 2), style: const TextStyle(fontSize: 12)),
            ),
            const SizedBox(height: 3),
            Text(usuarioPara.nombre, style: const TextStyle(color: Colors.black87, fontSize: 14))
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
    if(texto.length == 0) return;

    _focusNode.requestFocus();
    _textController.clear();

    final newMessage = ChatMessage(
      uid: '123', 
      texto: texto, 
      animationController: AnimationController(vsync: this, duration: const Duration(milliseconds: 200))
    );

    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _estaEscribiendo = false;
    });

    socketService!.emit('mensaje-personal', {
      'de': authService!.usuario!.uid,
      'para': chatService!.usuarioPara!.uid,
      'mensaje': texto
    });
  }

  @override
  void dispose() {
    for(ChatMessage message in _messages){
      message.animationController.dispose();
    }
    super.dispose();
  }
}