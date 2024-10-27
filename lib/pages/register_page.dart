import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/mostrar_alerta.dart';
import '../services/auth_service.dart';
import '../services/socket_service.dart';
import '../widgets/button_general.dart';
import '../widgets/custom_input.dart';
import '../widgets/labels.dart';
import '../widgets/logo.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                Logo(titulo: "Registro"),
                _Form(),
                Labels(
                  textPregunta: "Ya tienes una cuenta?",
                  textButton: "Ingresa ahora!",
                  ruta: 'login',
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
  final nombreCtrl = TextEditingController();
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
            icon: Icons.person_2_outlined,
            placeholder: 'Nombre',
            textEditingController: nombreCtrl,
          ),
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
            titulo: "Crear cuenta", 
            onPressed: authService.autenticando ? null : () async {
              FocusScope.of(context).unfocus();
              final registerOk = await authService.register(nombreCtrl.text.trim(), emailCtrl.text.trim(), passCtrl.text.trim());
              
              if(registerOk == true){
                socketService.connect();
                Navigator.pushReplacementNamed(context, 'usuarios');
              } else {
                mostrarAlerta(context, 'Registro incorrecto', registerOk);
              }
            },
          ),
        ],
      ),
    );
  }
}