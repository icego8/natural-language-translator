import 'package:flutter/material.dart';

class SelectLang extends StatefulWidget{
  SelectLang(this.fromLang,this.changed, {super.key});
  // using this ^ we are sending data from parent widget to child widget
  Function(String value) changed;
  var fromLang;

  @override
  State<SelectLang> createState() => _SelectLangState();
}

class _SelectLangState extends State<SelectLang> {
  var langs=['auto detect','English', 'हिन्दी', 'मराठी','Arabic','Assamese','Bengali','Bhojpuri',
    'German','Gujarati','Japanese','Korean','Nepali','Sanskrit','Sindhi','Spanish','Tamil','Telugu','Urdu'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Select Language"),
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.lightGreenAccent,
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return OutlinedButton(
            onPressed: (){
              widget.changed(langs[index]);
              Navigator.pop(context);
              },
            child: Text(langs[index], style: TextStyle(color: Colors.black54, fontSize: 20,),),
        );
      },
        itemCount: langs.length,
      ),
    );
  }
}