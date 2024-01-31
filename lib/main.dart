import 'package:flutter/material.dart';
import 'package:td_flutter/Models/menu.dart';
import 'package:td_flutter/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Art by Chiara',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(title: "E-Commerce",),
      debugShowCheckedModeBanner: false,
    );
  }
}


