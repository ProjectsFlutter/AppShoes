import 'package:app_shoes/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final double amount;
  const CartButton({Key? key, required this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.15),
          borderRadius: BorderRadius.circular(100.0)
        ),
        child: Row(
          children: [
            const SizedBox(width: 20.0,),
            Text('\$$amount', style: const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
            const Spacer(),
            const OrangeButton(texto: 'Add to cart'),
            const SizedBox(width: 20.0,)
          ],
        ),
      ),
    );
  }
}