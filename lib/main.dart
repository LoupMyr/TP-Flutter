import 'package:flutter/material.dart';
import 'package:td_flutter/Models/menu.dart';

import 'UI/article_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Art by Chiara',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(212, 175, 55, 1)),
        useMaterial3: true,
      ),
      home: const ArticleList(),

    );
  }
}


