import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String uid;
  final String texto; 

  const ChatMessage({
    super.key, 
    required this.uid, 
    required this.texto
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: uid == '123' ? _myMessage() : _notMyMessage(),
    );
  }

  Widget _myMessage(){
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(bottom: 5, left: 50, right: 5),
        decoration: BoxDecoration(
          color: const Color(0xff4D9EF6),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Text(texto, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _notMyMessage(){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.only(bottom: 5, right: 50, left: 5),
        decoration: BoxDecoration(
          color: const Color(0xffE4E5E8),
          borderRadius: BorderRadius.circular(20)
        ),
        child: Text(texto, style: const TextStyle(color: Colors.black87)),
      ),
    );
  }
}