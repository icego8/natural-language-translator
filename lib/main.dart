import 'package:flutter/material.dart';
import 'package:language_translation/translatorPage.dart';

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
class MyAppHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Language translation",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w700,color: Colors.yellow),),
            SizedBox(
              height: 200,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>language_translationPage()));
              },
              child: Text("Start",style: TextStyle(fontSize: 20)),
            ),

          ],
        ),
      ),
    );
  }
}