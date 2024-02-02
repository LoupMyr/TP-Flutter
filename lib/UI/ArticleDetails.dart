import 'dart:convert';

import 'package:flutter/material.dart';
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

  void addToCart() {
    widget.cart.addProduct(widget.article);
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Article ajouté à votre panier !"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(utf8.decode(widget.article.title.codeUnits)),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Column(
          children: [
            Text(
              utf8.decode(widget.article.title.codeUnits),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            Image.network(
              widget.article.image,
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: MediaQuery.sizeOf(context).height * 0.4,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                utf8.decode(widget.article.description.codeUnits),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const Center(
              child: Text(
                "Fiche technique du produit",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange),
              ),
            ),
            Container(

                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(30),
                decoration: const BoxDecoration(color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("Collection :"),
                          Text(utf8.decode(widget.article.collection.codeUnits)),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("Format :"),
                          Text(widget.article.size),
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text("Prix :"),
                          Text("${widget.article.price}€",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                        ]),
                  ],
                )),
            ElevatedButton(
                onPressed: addToCart, child: const Text("Commander")),
          ],
        ),
      ),
    );
  }
}
