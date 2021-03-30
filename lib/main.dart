import 'package:flutter/material.dart';
import 'View/homepage.dart';
import 'View/login.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Roboto',
          primaryColor: Color(0xFF4CAF50),
          primaryColorDark: Color(0xFF388E3C),
          primaryColorLight: Color(0xFFC8E6C9),
          accentColor: Color(0xFFFFC107)),
      initialRoute: '/',
      routes: {'/': (context) => Login(), '/home': (context) => HomePage()},
    );
  }
}
