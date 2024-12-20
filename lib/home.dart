import 'package:flutter/material.dart';
import 'package:new_translator/translatorPage.dart';

class MyAppHome extends StatelessWidget{
  const MyAppHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade400,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Translator",style: TextStyle(fontSize: 60,fontWeight: FontWeight.w700,color: Colors.yellow),),
            SizedBox(
              height: 100,
            ),
            SizedBox(height: 200,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(fixedSize: Size(130, 65)),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>language_translationPage()));
              },
              child: Text("Start",style: TextStyle(fontSize: 25)),
            ),

          ],
        ),
      ),
    );
  }
}