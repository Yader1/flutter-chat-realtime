import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final String ruta;
  final String textPregunta;
  final String textButton; 

  const Labels({super.key, required this.ruta, required this.textPregunta, required this.textButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            textPregunta, 
            style: const TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacementNamed(context, ruta);
            },
            child: Text(
              textButton, 
              style: TextStyle(color: Colors.blue.shade600, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}