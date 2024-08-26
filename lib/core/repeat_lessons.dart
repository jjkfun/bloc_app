import 'package:flutter/material.dart';

class RepeatLessons extends StatefulWidget {
  const RepeatLessons({super.key});

  @override
  State<RepeatLessons> createState() => _RepeatLessonsState();
}

class _RepeatLessonsState extends State<RepeatLessons> {

  // TODO:4 примитивных типы данных
// dart
  String name = 'hello';
  int age = 25 ;
  double kg = 56.45;
  bool isSunny = true;
// flutter
  Icon icon = const Icon(Icons.add);
  Widget container = Container();
  TextEditingController namecontroller = TextEditingController();


// TODO: GENERIC  <Widget, String>

  List<String> names = <String>['lol'];

////////////////////////////////////////////////////////////////////////////////////



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text('${name.length}')
      ],),

    );
  }
}


// 4 примитивных типы данных

String name = 'hello';
int age = 25 ;
double kg = 56.45;
bool isSunny = true;

////////////////////////////////////////////////////////////////////////////////////

// TODO: pick image web


