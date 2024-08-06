import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(titulo: "Messenger"),
                const _Form(),
                const Labels(
                  textPregunta: "No tienes cuenta?",
                  textButton:  "Crear una ahora!",
                  ruta: 'register',
                ),
            
                const Text(
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
            onPressed: (){
              var authService = Provider.of<AuthService>(context, listen: false);
              authService.login(emailCtrl.text, passCtrl.text);
            },
          ),
        ],
      ),
    );
  }
}