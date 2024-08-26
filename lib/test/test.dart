import 'dart:collection';

import 'package:flutter/material.dart';

class TestApp extends StatefulWidget {
  const TestApp({super.key});

  @override
  State<TestApp> createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  TextEditingController nameController = TextEditingController();

  final String name = 'lolololol';
  final int age = 34;
  final bool isSun = true;
  final double weight = 65.4;
  List<String> product = ['List', 'Leader', 'Loader'];
  Map<String, dynamic> person = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 1,
        children: <Widget>[
          const SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 130.0,
                  backgroundImage: NetworkImage(
                      'https://hips.hearstapps.com/hmg-prod/images/copycat-hamburger-helper1-1659463591.jpg'),
                  backgroundColor: Colors.purpleAccent,
                ),
                Text(
                  'Fried Chicken',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20),
                ),
                Text('We took inspiration from the viral TikTok upside-down puff pastry hack credited to @lilyghodrati and gave it a savory spin that’s perfect for holiday appetizers.'),
                SizedBox(height: 50,),
                CircleAvatar(
                  radius: 130.0,
                  backgroundImage: NetworkImage(
                      'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?resize=768,574'),
                  backgroundColor: Colors.purpleAccent,
                ),
                Text(
                  'Prosciutto and Brie Upside-Down Pastries',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20),
                ),
                Text('in French, designates the three layers of flaky puff pastry that are the hallmark of a mille-feuille. These delicate pastries traditionally take hours to make, so we came up with a version that produces the same showstopping dessert in about half the time.'),
                SizedBox(height: 50,),
                CircleAvatar(
                  radius: 130.0,
                  backgroundImage: NetworkImage(
                      'https://www.foodnetwork.com/content/dam/images/food/video/1/11/117/1176/11763609.jpg'),
                  backgroundColor: Colors.purpleAccent,
                ),
                Text(
                  'Fried Eggs with bacons and toasts',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Description',
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20),
                ),
                Text('Soaked in a cinnamon-and-orange syrup and topped with white chocolate, this super-crunchy bark is the perfect way to give day-old croissants a sweet new life.'),
              ],
            ),
          ),
          ElevatedButton(onPressed: (){}, child: Text('Follow',style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),)
        ],
      ),
    );
  }
}

// controller
// set state
// textfield
// Text('Follow',style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
