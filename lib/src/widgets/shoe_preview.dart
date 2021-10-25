import 'package:app_shoes/src/models/shoe_model.dart';
import 'package:app_shoes/src/pages/shoe_desc_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoePreview extends StatelessWidget {
  final bool? fullScreen;
  const ShoePreview({Key? key, this.fullScreen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!fullScreen!){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const ShoeDescPage()));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: fullScreen! ? 5.0 : 30.0, 
          vertical: fullScreen! ? 5.0: 10.0
        ),
        child: Container(
          height: fullScreen! ? 350.0 : 400.0,
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xffFFCF53),
            borderRadius: !fullScreen! 
                          ? BorderRadius.circular(50.0)
                          : const BorderRadius.only(
                            bottomLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(50.0),
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          )
          ),
          child: Column(
            children: [
              const Expanded(flex: 5, child: _ShowShadow()),
              if(!fullScreen!)
                const Expanded(flex: 2, child: _ShoeSize())
            ],
          ),
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
    final shoeModel = Provider.of<ShoeModel>(context);

    return GestureDetector(
      onTap: (){
        shoeModel.size = number;
      },
      child: Container(
        alignment: Alignment.center,
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          color:  (number == shoeModel.size) ?  const Color(0xffF1A23A) : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            if (number == shoeModel.size)
              const BoxShadow(color: Color(0xffF1A23A), blurRadius: 10.0, offset: Offset(0, 5))
          ]
        ),
        child: Text("$number", 
        style: TextStyle(
          color: (number == shoeModel.size) ? Colors.white : const Color(0xffF1A23A), 
          fontWeight: FontWeight.bold, 
          fontSize: 16.0
        )),
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
        width: 220.0,
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
