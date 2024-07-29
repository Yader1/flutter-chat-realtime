import 'package:flutter/material.dart';

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
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Logo(),
              const _Form(),
              const Labels(),
              ButtonGeneral(
                titulo: "Ingresar", 
                onPressed: (){
                    
                },
              ),
          
              const Text(
                "Terminos y condiciones de uso", 
                style: TextStyle(color: Colors.black45, fontSize: 12, fontWeight: FontWeight.w200),
              ),
            ],
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
        ],
      ),
    );
  }
}