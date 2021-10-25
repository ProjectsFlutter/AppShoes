import 'package:app_shoes/src/models/shoe_model.dart';
import 'package:app_shoes/src/pages/shoe_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShoeModel())
      ],
      child:  const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false ,
      title: 'Shoes App',
      home: ShoePage()
    );
  }
}