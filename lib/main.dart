import 'package:flutter/material.dart';
import 'screens/introScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
          ),
          textTheme: const TextTheme(
              headline5: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w400),
              bodyText2: TextStyle(
                  fontFamily: 'Red Hat Display',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400))),
      home: IntroScreen(),
    );
  }
}
