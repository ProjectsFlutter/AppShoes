import 'package:app_shoes/src/widgets/shoe_description.dart';
import 'package:app_shoes/src/widgets/shoe_preview.dart';
import 'package:app_shoes/src/widgets/widgets.dart';
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
                  _BuyNow()
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}

class _BuyNow extends StatelessWidget {
  const _BuyNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        margin: const EdgeInsets.only(top: 20.0),
        child: Row( 
          children:const [
              Text("\$180.0", style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
              Spacer(),
              OrangeButton(texto: 'Buy now', alto: 40.0, ancho: 100.0,)
          ],
        ),
    );
  }
}