// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ButtonGeneral extends StatelessWidget {
  final String titulo;
  Function() onPressed;
  
  ButtonGeneral({
    super.key,
    required this.titulo, 
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        backgroundColor: Colors.blue,
        shape: const StadiumBorder()
      ),
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(titulo, style: const TextStyle(color: Colors.white, fontSize: 18))
        )
      )
    );
  }
}
