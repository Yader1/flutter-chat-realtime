import 'package:flutter/material.dart';
import 'package:flutter_chat_realtime/helpers/mostrar_alerta.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';
import '../services/socket_service.dart';

import '../widgets/button_general.dart';
import '../widgets/custom_input.dart';
import '../widgets/labels.dart';
import '../widgets/logo.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(titulo: "Messenger"),
                _Form(),
                Labels(
                  textPregunta: "No tienes cuenta?",
                  textButton:  "Crear una ahora!",
                  ruta: 'register',
                ),
            
                Text(
                  "Terminos y condiciones de uso", 
                  style: TextStyle(color: Colors.black45, fontSize: 12, fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}

class _Form extends StatefulWidget {
  const _Form();

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var authService = Provider.of<AuthService>(context);
    var socketService = Provider.of<SocketService>(context);

    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          CustomInput(
            icon: Icons.mail_outline_outlined,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textEditingController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contrasenia',
            textEditingController: passCtrl,
            isPassword: true,
          ),

          ButtonGeneral(
            titulo: "Ingresar", 
            onPressed: authService.autenticando ? null : () async {
              FocusScope.of(context).unfocus();
              final loginOk = await authService.login(emailCtrl.text.trim(), passCtrl.text.trim());
              
              if(loginOk){
                socketService.connect();
                Navigator.pushReplacementNamed(context, 'usuarios');
              } else {
                mostrarAlerta(context, 'Login incorrecto', 'Revisar sus credenciales.');
              }
            },
          ),
        ],
      ),
    );
  }
}