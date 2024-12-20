import 'package:flutter/material.dart';
import 'package:new_translator/home.dart';
import 'package:new_translator/translatorPage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "language_translation",
      debugShowCheckedModeBanner: false,
      home: MyAppHome(),
    );
  }
}

