import 'package:flutter/material.dart';
import 'package:td_flutter/Controllers/ArticleController.dart';
import 'package:td_flutter/Layout/AppBarLayout.dart';
import 'package:td_flutter/Models/Article.dart';
import 'package:td_flutter/Models/Cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Cart _cart = Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarLayout.buildAppBar(widget.title, context, _cart),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}