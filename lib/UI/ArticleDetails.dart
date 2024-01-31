import 'package:flutter/material.dart';
import 'package:td_flutter/Controllers/ArticleController.dart';
import 'package:td_flutter/Models/Article.dart';

import '../Models/Cart.dart';

class ArticleDetails extends StatefulWidget {
  final Article article;
  final Cart cart;
  const ArticleDetails({super.key, required this.article, required this.cart});

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {

  //Article article = Article(1, "Blood Sweet and Tears", "Une impression personnalisée représentant un mélange saisissant de beauté et de douleur.", "https://i.postimg.cc/X7QWRd2h/20230913-135630.jpg", 25.99, "A4", "Collection printemps 2024");

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.article.title),

      ),

      body:  Container(
        decoration: const BoxDecoration(
            color: Colors.black
        ),
        child: Column(
          children: [
            Text(widget.article.title
              ,style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange
              ),),
            Image.network(widget.article.image,width: MediaQuery.sizeOf(context).width * 0.9,
              height: MediaQuery.sizeOf(context).height * 0.4,),
            Padding(padding: EdgeInsets.all(10),
              child: Text(widget.article.description,
                style: TextStyle(
                    color: Colors.white
                ),),)

          ],
        ),
      ),
    );
  }
}