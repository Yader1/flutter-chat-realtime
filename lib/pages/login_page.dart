import 'package:flutter/material.dart';

import '../widgets/custom_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _Logo(),
            _Form(),
            _Labels(),

            Text(
              "Terminos y condiciones de uso", 
              style: TextStyle(color: Colors.black45, fontSize: 12, fontWeight: FontWeight.w200),
            ),
          ],
        ),
      )
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        margin: const EdgeInsets.only(top: 50.0),
        child: const Column(
          children: [
            Image(image: AssetImage('assets/tag-logo.png')),
            SizedBox(height: 20.0),
            Text("Messenger", style: TextStyle(fontSize: 30))
          ],
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
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: const Column(
        children: [
          CustomInput(),
          CustomInput()

          //ElevatedButton(
            //onPressed: (){}, 
            //child: const Text("Login"),
          //)
        ],
      ),
    );
  }
}

class _Labels extends StatelessWidget {
  const _Labels({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Text(
            "No tienes cuenta?", 
            style: TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 10),
          Text(
            "Crear una ahora!", 
            style: TextStyle(color: Colors.blue.shade600, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}