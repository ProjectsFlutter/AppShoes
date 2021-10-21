import 'package:app_shoes/src/pages/shoe_page.dart';
import 'package:app_shoes/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Shoes App',
      home: ShoePreview()
    );
  }
}