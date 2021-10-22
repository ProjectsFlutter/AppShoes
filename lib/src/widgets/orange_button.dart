import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String texto;
  const OrangeButton({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 150.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(100.0)
      ),
      child: Text(texto, style: const TextStyle(color: Colors.white)),
    );
  }
}