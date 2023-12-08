import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:translator/translator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  TextToSpeech tt = TextToSpeech();

  TextEditingController english = TextEditingController();
  String? persian = ' ';
  final translator = GoogleTranslator();
  void translate() {
    translator.translate("${english.text}", from: 'en', to: 'fa').then((s) {
      print(s);
      persian = s.text;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: Text("Google Translator"),
        centerTitle: true,
        // backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: english,
                  decoration: InputDecoration(
                      // fillColor: Colors.white,
                      labelText: "Enter an expression",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    // color: Colors.white70,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListView(children: [
                    Text(
                      '$persian',
                      textDirection: TextDirection.rtl,
                    ),
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            translate();
                          });
                        },
                        child: Text("Translate")),
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                        onPressed: () {
                          tt.speak('${english.text}');
                        },
                        icon: Icon(Icons.record_voice_over))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(78.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Alert(
                            context: context,
                            desc: "Flutter developer",
                            title: "I .....")
                        .show();
                  },
                  child: Text("Alert1")),
              ElevatedButton(
                  onPressed: () {
                    Alert(
                            context: context,
                            desc: "Flutter developer",
                            title: "I .....",
                            type: AlertType.warning)
                        .show();
                  },
                  child: Text("Alert2")),
              ElevatedButton(
                  onPressed: () {
                    Alert(
                        context: context,
                        desc: "Flutter developer",
                        title: "I .....",
                        type: AlertType.error,
                        buttons: [
                          DialogButton(
                            child: Text("Exit"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          DialogButton(
                            child: Text("GO"),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ]).show();
                  },
                  child: Text("Alert3")),
            ],
          ),
        ),
      ),
    );
  }
}

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,),
      body:  Container(
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (c, i) {
              return ListTile(title:
              Text("Noun = ${nouns[i]}        adjective = ${adjectives[i]}"),
              );
            }
        ),
      ),
    );
  }
}

class Screen4 extends StatefulWidget {
  const Screen4({super.key});

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "This is Center Short Toast",
                  toastLength: Toast.LENGTH_LONG,
                  timeInSecForIosWeb: 3,
                  gravity: ToastGravity.CENTER,
                  webShowClose: true,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
              child: Text('toast'))),

    );
  }
}

class Screen5 extends StatefulWidget {
  const Screen5({super.key});

  @override
  State<Screen5> createState() => _Screen5State();
}

class _Screen5State extends State<Screen5> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: ()async{
          final p1=new AudioPlayer();
          p1.play(AssetSource('note1.wav'));
        }, child:Text("OK")),
      ),
    );
  }
}

class Screen6 extends StatefulWidget {
  const Screen6({super.key});

  @override
  State<Screen6> createState() => _Screen6State();
}

class _Screen6State extends State<Screen6> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("A kind of fount",style: GoogleFonts.anton(),),SizedBox(height: 20,),
            Text("A kind of fount",style: GoogleFonts.aldrich(),),SizedBox(height: 20,),
            Text("A kind of fount",style: GoogleFonts.aboreto(),),SizedBox(height: 20,),
            Text("A kind of fount",style: GoogleFonts.abyssinicaSil(),),
          ],
        ),
      ),
    );
  }
}

class Screen7 extends StatefulWidget {
  const Screen7({super.key});

  @override
  State<Screen7> createState() => _Screen7State();
}

class _Screen7State extends State<Screen7> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.facebook),SizedBox(height: 20,),
            FaIcon(FontAwesomeIcons.male),SizedBox(height: 20,),
            FaIcon(FontAwesomeIcons.fileMedicalAlt),SizedBox(height: 20,),
            FaIcon(FontAwesomeIcons.alignJustify),SizedBox(height: 20,),
            FaIcon(FontAwesomeIcons.folder),SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
