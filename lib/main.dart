import 'package:flutter/material.dart';
import 'converter_screen.dart';
import 'category_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData(
        primaryColor:
            Colors.purple, // Define a cor principal do AppBar como roxo
      ),
      routes: {
        '/': (context) => CategoryScreen(),
        '/converter': (context) => ConverterScreen(),
      },
    );
  }
}
