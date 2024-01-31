import 'package:flutter/material.dart';
import 'package:td_flutter/Controllers/ArticleController.dart';
import 'package:td_flutter/Models/Article.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void getArticles() async {
    List<Article> articles = await ArticleController.getArticles();
    for(Article elt in articles){
      print(elt.title);
    }
  }

  @override
  Widget build(BuildContext context) {
    getArticles();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
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