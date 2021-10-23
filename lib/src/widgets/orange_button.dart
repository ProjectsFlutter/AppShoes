import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String texto;
  final double? alto;
  final double? ancho;
  final Color color;

  const OrangeButton({Key? key, required this.texto, this.alto = 50.0, this.ancho = 150.0, this.color = Colors.orange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: ancho!,
      height: alto!,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100.0)
      ),
      child: Text(texto, style: const TextStyle(color: Colors.white)),
    );
  }
}