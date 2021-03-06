import 'package:app_shoes/src/helpers/helpers.dart';
import 'package:app_shoes/src/models/shoe_model.dart';
import 'package:app_shoes/src/widgets/shoe_description.dart';
import 'package:app_shoes/src/widgets/shoe_preview.dart';
import 'package:app_shoes/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoeDescPage extends StatelessWidget {
  const ShoeDescPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    changeStatusLight();
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
                     changeStatusDark();
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
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: const [
              Positioned(left: 90.0, child: _ButtonColor(color: Color(0xffC6D642), dirImage: 'assets/imgs/verde.png', index: 4)),
              Positioned(left: 60.0, child: _ButtonColor(color: Color(0xffFFAD29), dirImage: 'assets/imgs/amarillo.png', index: 3)),
              Positioned(left: 30.0, child: _ButtonColor(color: Color(0xff2099F1), dirImage: 'assets/imgs/azul.png', index: 2)),
              _ButtonColor(color: Color(0xff364D56), dirImage: 'assets/imgs/negro.png', index: 1,), 
              ],
            ),
          ),
           const Expanded(
             child: OrangeButton(texto: "More related items", alto: 30.0, ancho: 170.0, color: Color(0xffFFC675)
             )
          )
        ],
      ),
    );
  }
}

class _ButtonColor extends StatelessWidget {
  final Color color;
  final String dirImage;
  final int index;
  const _ButtonColor({Key? key, required this.color, required this.dirImage, required this.index }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context, listen: false);
    return GestureDetector(
      onTap: (){
        shoeModel.assetImage = dirImage;
      },
      child: TweenAnimationBuilder<double>(
        child: Container(
            height: 45.0,
            width: 45.0,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle
            ),
        ),
        tween: Tween(begin: 100.0, end: 0.0),
        duration: const Duration(seconds: 1),
        builder: (context, value, _child) {
          return Transform.translate(
            offset: Offset(-index * value, 0.0),
            child: _child,
          );
        }
      ),
    );
  }
}

class _BuyNow extends StatefulWidget {
  const _BuyNow({Key? key}) : super(key: key);

  @override
  State<_BuyNow> createState() => _BuyNowState();
}

class _BuyNowState extends State<_BuyNow> with SingleTickerProviderStateMixin{
  late AnimationController controlador;
  late Animation<double> moveUp;
  late Animation<double> moveDown;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controlador = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    moveUp = Tween(begin: 0.0, end: -100.0).animate(
      CurvedAnimation(parent: controlador, curve: const Interval(0, 0.5, curve: Curves.bounceOut))
    );
    moveDown = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: controlador, curve: const Interval(0.5, 1.0, curve: Curves.bounceOut))
    );
    controlador.forward();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controlador.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        margin: const EdgeInsets.only(top: 20.0),
        child: Row( 
          children:[
              const Text("\$180.0", style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
              const Spacer(),
              AnimatedBuilder(
                animation: controlador,
                child: const OrangeButton(texto: 'Buy now', alto: 40.0, ancho: 100.0),
                builder: (context,  _child) {
                  return Transform.translate(
                    offset: Offset(0.0, moveUp.value + moveDown.value),
                    child: _child,
                  );
                }
              )
          ],
        ),
    );
  }
}