import 'package:flutter/material.dart';
import 'package:td_flutter/Layout/AppBarLayout.dart';
import 'package:td_flutter/Models/Cart.dart';
import 'package:td_flutter/UI/article_list.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Cart _cart = Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarLayout.buildAppBar(widget.title, context, _cart),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(),
                  onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArticleList(_cart),
                        ),
                      ),
                  child: const Text("Voir la collection 2024"))
            ],
          ),
        ),
      ),
    );
  }
}
