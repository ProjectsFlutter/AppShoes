import 'package:app_shoes/src/widgets/shoe_description.dart';
import 'package:app_shoes/src/widgets/shoe_preview.dart';
import 'package:flutter/material.dart';

class ShoeDescPage extends StatelessWidget {
  const ShoeDescPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ShoePreview(fullScreen: true),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  ShoeDescription(title: 'Nike Air Max 720', description: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}