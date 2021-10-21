import 'package:flutter/material.dart';

class ShoePreview extends StatelessWidget {
  const ShoePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Container(
        height: 450.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffFFCF53),
          borderRadius: BorderRadius.circular(50.0)
        ),
        child: Column(
          children: const [
            _ShowShadow()
          ],
        ),
      ),
    );
  }
}

class _ShowShadow extends StatelessWidget {
  const _ShowShadow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children: const [
          Positioned(
            bottom: 20.0,
            right: 0.0,
            child: _Shadow()
          ),
          Image(image: AssetImage('assets/imgs/azul.png'))
        ],
      ),
    );
  }
}

class _Shadow extends StatelessWidget {
  const _Shadow({ Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230.0,
        height: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: const [
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 40.0)
          ]
        )
      ),
    );
  }
}
