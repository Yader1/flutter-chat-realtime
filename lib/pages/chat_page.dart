import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

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
              height: 50,
            )
          ],
        ),
      )
    );
  }
}