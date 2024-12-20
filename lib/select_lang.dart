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
  final langs = [
    'Automatic', 'Afrikaans', 'Albanian', 'Amharic', 'Arabic', 'Armenian', 'Assamese', 'Aymara',
    'Azerbaijani', 'Bambara', 'Basque', 'Belarusian', 'Bengali', 'Bhojpuri', 'Bosnian', 'Bulgarian',
    'Catalan', 'Cebuano', 'Chinese (Simplified)', 'Chinese (Traditional)', 'Corsican', 'Croatian',
    'Czech', 'Danish', 'Dhivehi', 'Dogri', 'Dutch', 'English', 'Esperanto', 'Estonian', 'Ewe',
    'Filipino (Tagalog)', 'Finnish', 'French', 'Frisian', 'Galician', 'Georgian', 'German', 'Greek',
    'Guarani', 'Gujarati', 'Haitian Creole', 'Hausa', 'Hawaiian', 'Hebrew', 'Hindi', 'Hmong',
    'Hungarian', 'Icelandic', 'Igbo', 'Ilocano', 'Indonesian', 'Irish', 'Italian', 'Japanese',
    'Javanese', 'Kannada', 'Kazakh', 'Khmer', 'Kinyarwanda', 'Konkani', 'Korean', 'Krio',
    'Kurdish (Kurmanji)', 'Kurdish (Sorani)', 'Kyrgyz', 'Lao', 'Latin', 'Latvian', 'Lingala',
    'Lithuanian', 'Luganda', 'Luxembourgish', 'Macedonian', 'Maithili', 'Malagasy', 'Malay',
    'Malayalam', 'Maltese', 'Maori', 'Marathi', 'Meiteilon (Manipuri)', 'Mizo', 'Mongolian',
    'Myanmar (Burmese)', 'Nepali', 'Norwegian', 'Nyanja (Chichewa)', 'Odia (Oriya)', 'Oromo',
    'Pashto', 'Persian', 'Polish', 'Portuguese', 'Punjabi', 'Quechua', 'Romanian', 'Russian',
    'Samoan', 'Sanskrit', 'Scots Gaelic', 'Sepedi', 'Serbian', 'Sesotho', 'Shona', 'Sindhi',
    'Sinhala', 'Slovak', 'Slovenian', 'Somali', 'Spanish', 'Sundanese', 'Swahili', 'Swedish',
    'Tagalog (Filipino)', 'Tajik', 'Tamil', 'Tatar', 'Telugu', 'Thai', 'Tigrinya', 'Tsonga',
    'Turkish', 'Turkmen', 'Twi (Akan)', 'Ukrainian', 'Urdu', 'Uyghur', 'Uzbek', 'Vietnamese',
    'Welsh', 'Xhosa', 'Yiddish', 'Yoruba', 'Zulu'
  ];

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