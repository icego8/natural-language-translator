import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:new_translator/get_code.dart';
import 'package:new_translator/select_lang.dart';
import 'package:toast/toast.dart';
import 'package:translator/translator.dart';

class language_translationPage extends  StatefulWidget{
  @override
  State<language_translationPage> createState() => _language_translationPageState();
}

class _language_translationPageState extends State<language_translationPage> {
  var temp=TextEditingController();
  var langs=['auto detect','English', 'हिन्दी', 'मराठी','Arabic','Assamese','Bengali','Bhojpuri',
    'German','Gujarati','Japanese','Korean','Nepali','Sanskrit','Sindhi','Spanish','Tamil','Telugu','Urdu'];
  var fromLang="From";
  var toLang="To";
  var ans="";
  var flag1=false;
  var flag2=false;
  void translate(String src, String dest, String input) async{
    GoogleTranslator translator = GoogleTranslator();
    var traslate=await translator.translate(input, from: src, to: dest);
    setState(() {
      ans=traslate.text.toString();
    });
    if(src=='--' || dest=='--'){
      setState(() {
        ans="fail to translate";
      });
    }
  }
  final button_style= ElevatedButton.styleFrom(foregroundColor: Colors.amber, backgroundColor: Colors.indigo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("text translation",style: TextStyle(color: Colors.blueGrey.shade800,fontSize: 23),),
        foregroundColor: Colors.blueGrey.shade800,
        backgroundColor: Colors.yellowAccent,
      ),
      body: Container(
        color: Colors.blue.shade50,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     ElevatedButton(
                //       style: button_style,
                //         onPressed: (){
                //             flag1=true;
                //             Navigator.push(
                //                 context,
                //                 MaterialPageRoute(builder: (BuildContext context) => SelectLang(fromLang,(value){
                //                   fromLang=value;
                //                 })
                //                 )
                //             );
                //           setState(() {
                //           });
                //         },
                //         child: Text(fromLang),
                //     ),
                //     IconButton(
                //         onPressed: (){
                //             if(flag1 && flag2){
                //               String a=fromLang;
                //               fromLang=toLang;
                //               toLang=a;
                //             }
                //           setState(() {
                //           });
                //         },
                //         icon: Icon(Icons.swap_horiz,size: 50,color: Colors.green,)
                //     ),
                //     ElevatedButton(
                //       style: button_style,
                //       onPressed: (){
                //             flag2=true;
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(builder: (BuildContext context) => SelectLang(toLang,(value){
                //                 toLang=value;
                //               })
                //               )
                //           );
                //         setState(() {
                //         });
                //       },
                //       child: Text(toLang),
                //     ),
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton(
                      focusColor:Colors.pink.shade400,
                        iconDisabledColor: Colors.pink.shade400,
                        iconEnabledColor: Colors.pink.shade400,
                        hint: Text(fromLang, style: TextStyle(color: Colors.pink.shade400),),
                        items:langs.map((String dropDownStringItem){
                          return DropdownMenuItem(value: dropDownStringItem,child: Text(dropDownStringItem),);
                        }).toList() ,
                        onChanged: (String? value){
                          setState(() {
                            flag1=true;
                            fromLang=value!;
                          });
                        },
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      dropdownColor: Colors.green.shade100,
                      style: const TextStyle(color: Colors.teal),
                    ),
                    IconButton(
                        onPressed: (){
                            if(flag1 && flag2){
                              String a=fromLang;
                              fromLang=toLang;
                              toLang=a;
                            }
                          setState(() {
                          });
                        },
                        icon: Icon(Icons.swap_horiz,size: 50,color: Colors.green,)
                    ),
                    DropdownButton(
                        hint: Text(toLang, style: TextStyle(color: Colors.pink.shade400),),
                        items:langs.map((String dropDownStringItem){
                          return DropdownMenuItem(child: Text(dropDownStringItem),value: dropDownStringItem,);
                        }).toList() ,
                        onChanged: (String? value){
                          setState(() {
                            flag1=true;
                            toLang=value!;
                          });
                        },
                        focusColor:Colors.pink.shade400,
                        iconDisabledColor: Colors.pink.shade400,
                        iconEnabledColor: Colors.pink.shade400,
                      borderRadius: const BorderRadius.all(Radius.circular(15)),
                      dropdownColor: Colors.green.shade100,
                      style: const TextStyle(color: Colors.teal),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    // here we are using TextFormField inplace of TextField because it has a validator inbuilt
                    keyboardType: TextInputType.text,
                    controller: temp,
                    style: const TextStyle(color: Colors.indigo),
                    decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),
                        labelText: "Enter here",
                        hintText: 'enter your text',
                        border:OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.indigo,
                                width: 1
                            )
                        ),
                      errorStyle: TextStyle(color: Colors.white),
                    ),
                    validator: (value){
                      return (value==null || value.isEmpty)? "please enter text for translate":null;
                      // if(value==null || value.isEmpty){
                      //   return "please enter text for translate";
                      // }
                      // return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: button_style,
                    onPressed:(){
                      translate(getLanguageCode(fromLang), getLanguageCode(toLang), temp.text.toString());
                    } ,
                    child: const Text("translate",style: TextStyle(fontSize: 18),)
                ),
                const SizedBox(
                  height: 47,
                ),
                Text(ans,style: const TextStyle(color: Colors.indigo,fontSize: 30),),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: button_style,
                    onPressed: (){
                      FlutterClipboard.copy(ans);
                      Toast.show("copied!!",duration: 1);
                    },
                    child: const Text("Copy"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
