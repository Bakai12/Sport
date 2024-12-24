import 'package:flutter/material.dart';
import 'package:pro_sport/page_exercise/arm.dart';
import 'package:pro_sport/page_exercise/back_abs.dart';
import 'package:pro_sport/page_exercise/chest.dart';
import 'package:pro_sport/page_exercise/legs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
      padding: const EdgeInsets.only(left: 80.0, right: 80.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 140), // Добавлено для смещения текста вниз
            Text(
              'Select traning day',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 30),
            ),
            SizedBox(height: 120),
            ElevatedButton(
  onPressed: () {
    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LegsPage()),
            );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 213, 27, 17),
    padding: const EdgeInsets.symmetric(vertical: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20), // Добавляем borderRadius
    ),
  ),
  child: Text(
    'Legs',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 25,  
      color: Colors.white,
    ),
  ),
),
            SizedBox(height: 30),
            ElevatedButton(
  onPressed: () {
    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BackAbs()),
            );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 213, 27, 17),
    padding: const EdgeInsets.symmetric(vertical: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20), // Добавляем borderRadius
    ),
  ),
  child: Text(
    'Back and Abs',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 25,  
      color: Colors.white,
    ),
  ),
),
            SizedBox(height: 30),
            ElevatedButton(
  onPressed: () {
    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ArmPage()),
            );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 213, 27, 17),
    padding: const EdgeInsets.symmetric(vertical: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20), // Добавляем borderRadius
    ),
  ),
  child: Text(
    'Arm',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 25,  
      color: Colors.white,
    ),
  ),
),
           SizedBox(height: 30),
           ElevatedButton(
  onPressed: () {
    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChestPage()),
            );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 213, 27, 17),
    padding: const EdgeInsets.symmetric(vertical: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20), // Добавляем borderRadius
    ),
  ),
  child: Text(
    'Chest',
    textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: 25,  
      color: Colors.white,
    ),
  ),
),
          ],
        ),
      ),
    );
  }
}
