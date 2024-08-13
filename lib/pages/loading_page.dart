import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/usuarios_page.dart';
import '../pages/login_page.dart';

import '../services/auth_service.dart';
import '../services/socket_service.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return const Center(
            child: Text("Espere..."),
          );
        }
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    var authService = Provider.of<AuthService>(context, listen: false);
    var socketService = Provider.of<SocketService>(context, listen: false);
    
    final autenticado = await authService.isLoggedIn();

    if(autenticado){
      socketService.connect();
      Navigator.pushReplacement(
        context, 
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const UsuariosPage(),
          transitionDuration: const Duration(milliseconds: 0)
        )
      );
    } else {
      //Navigator.pushReplacementNamed(context, "login");
      Navigator.pushReplacement(
        context, 
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LoginPage(),
          transitionDuration: const Duration(milliseconds: 0)
        )
      );
    }
  }
}