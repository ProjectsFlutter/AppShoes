import 'package:flutter/material.dart';

class ShoeDescription extends StatelessWidget {
  final String title;
  final String description;

  const ShoeDescription({ Key? key, required this.title, required this.description }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20,),
          Text(title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
          const SizedBox(height: 20,),
          Text(description, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black54, height: 1.6))
        ],
      ),
    );
  }
}