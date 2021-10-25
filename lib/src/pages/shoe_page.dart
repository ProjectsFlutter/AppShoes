 import 'package:app_shoes/src/helpers/helpers.dart';
import 'package:app_shoes/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ShoePage extends StatelessWidget {
  const ShoePage({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     changeStatusDark();
     return Scaffold(
       body: Column(
         children: [
           const CustomAppBar(texto: "For you"),
           const SizedBox(height: 20.0),
           Expanded(
             child: SingleChildScrollView(
               physics: const BouncingScrollPhysics(),
               child: Column(
                 children: const [
                   Hero(tag: 'shoe-1', child: ShoePreview()),           
                   ShoeDescription(title: 'Nike Air Max 720', description: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",),
                 ],
               ),
             ),
           ),
           const CartButton(amount: 180.0,)
         ],
       ),
     );
   }
 }