import 'package:flutter/material.dart';

import '../models/usuario.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({super.key});

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final usuarios = [
    Usuario(online: true, email: 'yader@test.com', nombre: 'Yader', uuid: '1'),
    Usuario(online: false, email: 'xib@test.com', nombre: 'Xib Ach', uuid: '2'),
    Usuario(online: true, email: 'oneall@test.com', nombre: 'Oneall', uuid: '3')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mi nombre", style: TextStyle(color: Colors.black87)),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){

          },
          icon: const Icon(Icons.exit_to_app_rounded, color: Colors.black87),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            //child: Icon(Icons.check_circle, color: Colors.blue.shade400),
            child: const Icon(Icons.offline_bolt, color: Colors.red),
          )
        ],
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, i) => ListTile(
          title: Text(usuarios[i].nombre),
          leading: CircleAvatar(
            child: Text(usuarios[i].nombre.substring(0,2)),
          ),
          trailing: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: usuarios[i].online ? Colors.green.shade300 : Colors.red,
              borderRadius: BorderRadius.circular(100)
            ),
          ),
        ), 
        separatorBuilder: (_, i) => const Divider(), 
        itemCount: usuarios.length
      )
    );
  }
}