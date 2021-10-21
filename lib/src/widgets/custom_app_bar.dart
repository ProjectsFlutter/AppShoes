import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String texto;
  const CustomAppBar({ Key? key, required this.texto }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
          margin: const EdgeInsets.only(top: 30.0),
          width: double.infinity,
          child: Row(
            children:[
              Text(texto, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const Spacer(),
              const Icon(Icons.search)
            ],
          ),
        ),
      ),
    );
  }
}