import 'package:flutter/material.dart';

class ShoePreview extends StatelessWidget {
  const ShoePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Container(
        height: 430.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffFFCF53),
          borderRadius: BorderRadius.circular(50.0)
        ),
        child: Column(
          children: const [
            Expanded(flex: 4, child: _ShowShadow()),
            Expanded(flex: 1, child: _ShoeSize())
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
    return Stack(
      children: const [
        Positioned(
          bottom: 20.0,
          right: 0.0,
          child: _Shadow()
        ),
        Image(image: AssetImage('assets/imgs/azul.png')),
      ],
    );
  }
}

class _ShoeSize extends StatelessWidget {
  const _ShoeSize({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        _Size(number: 7.0),
        _Size(number: 7.5),
        _Size(number: 8.0),
        _Size(number: 8.5),
        _Size(number: 9.0),
        _Size(number: 9.5),
      ],
    );
  }
}

class _Size extends StatelessWidget {
  final double number;
  const _Size({ Key? key, required this.number }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50.0,
      width: 50.0,
      decoration: BoxDecoration(
        color:  (number == 9.0) ?  const Color(0xffF1A23A) : Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          if (number == 9.0)
            const BoxShadow(color: Color(0xffF1A23A), blurRadius: 10.0, offset: Offset(0, 5))
        ]
      ),
      child: Text("$number", 
      style: TextStyle(
        color: (number == 9.0) ? Colors.white : const Color(0xffF1A23A), 
        fontWeight: FontWeight.bold, 
        fontSize: 16.0)
      ),
    );
  }
}

class _Shadow extends StatelessWidget {
  const _Shadow({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230.0,
        height: 120.0,
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
