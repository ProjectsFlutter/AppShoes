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
          Stack(
            children: [
              const Hero(tag: 'shoe-1', child: ShoePreview(fullScreen: true)),
              Positioned(
                top: 50.0,
                child: FloatingActionButton(
                  onPressed:(){
                    Navigator.pop(context);
                  } , 
                  child: const Icon(Icons.chevron_left, color: Colors.white, size: 60.0),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                )
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  ShoeDescription(title: 'Nike Air Max 720', description: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so."),
                  _BuyNow(),
                  _ColorsSection(),
                  _LikeCartSetting()
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}

class _LikeCartSetting extends StatelessWidget {
  const _LikeCartSetting({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30.0),
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _ShadedButton(icon: Icon(Icons.favorite, color: Colors.red, size: 25.0,)),
          _ShadedButton(icon: Icon(Icons.shopping_cart, color: Colors.grey.withOpacity(0.4), size: 25.0,)),
          _ShadedButton(icon: Icon(Icons.settings, color: Colors.grey.withOpacity(0.4), size: 25.0,)),
        ],
      ),
    );
  }
}

class _ShadedButton extends StatelessWidget {
  final Icon icon;
  const _ShadedButton({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: 50.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: -5, blurRadius: 20, offset: Offset(0, 10))
        ]
      ),
      child: icon,
    );
  }
}

class _ColorsSection extends StatelessWidget {
  const _ColorsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: const [
              Positioned(left: 90.0, child: _ButtonColor(color: Color(0xffC6D642))),
              Positioned(left: 60.0, child: _ButtonColor(color: Color(0xffFFAD29))),
              Positioned(left: 30.0, child: _ButtonColor(color: Color(0xff2099F1))),
              _ButtonColor(color: Color(0xff364D56)), 
              ],
            ),
          ),
          const Spacer(),
          const OrangeButton(texto: "More related items", alto: 30.0, ancho: 170.0, color: Color(0xffFFC675),)
        ],
      ),
    );
  }
}

class _ButtonColor extends StatelessWidget {
  final Color color;
  const _ButtonColor({Key? key, required this.color }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: 45.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
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