 import 'package:app_shoes/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ShoePage extends StatelessWidget {
  const ShoePage({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Column(
         children: const [
           CustomAppBar(texto: "For you"),
           SizedBox(height: 20.0),
           ShoePreview()           
         ],
       ),
     );
   }
 }