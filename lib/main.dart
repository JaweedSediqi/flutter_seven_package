import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Home.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: Main(),
  ));
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  List names = [
    "Dictunary",
    "Alert Dialog",
    "Nouns & Adjective",
    "Notification",
    "Sound",
    "Gogale Fount",
    "Icons"
  ];
  List icons = [
    Icon(Icons.translate),
    Icon(Icons.add_alert),
    Icon(Icons.wordpress),
    Icon(Icons.notification_add_outlined),
    Icon(Icons.keyboard_voice),
    Icon(Icons.font_download),
    Icon(Icons.insert_emoticon_outlined),
  ];
  List linkes = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
    Screen5(),
    Screen6(),
    Screen7(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Seven Most Useful Packages", style: GoogleFonts.anton()),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              switch (index) {
                case 0:
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => linkes[0]));
                  break;
                case 1:
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => linkes[1]));
                  break;
                case 2:
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => linkes[2]));
                  break;
                case 3:
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => linkes[3]));
                  break;
                case 4:
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => linkes[4]));
                  break;
                case 5:
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => linkes[5]));
                  break;
                case 6:
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => linkes[6]));
                  break;
              }
            },
            // tileColor: Colors.blue.shade200,
            splashColor: Colors.blue,
            // focusColor: Colors.lightBlue.shade400,
            subtitle: Text(
              '${index + 1}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: icons[index],
            title: Center(
                child: Text(
              names[index],
            )),
            trailing: Icon(Icons.keyboard_arrow_right),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
            height: 1,
            thickness: 1,
          );
        },
      ),
    );
  }
}


