import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:td_flutter/Layout/AppBarLayout.dart';
import 'package:td_flutter/Layout/AppStyle.dart';
import 'package:td_flutter/Models/Cart.dart';

class PanierPage extends StatefulWidget {
  final Cart _cart;

  const PanierPage(this._cart, {super.key, required this.title});

  final String title;

  @override
  State<PanierPage> createState() => _PanierPageState();
}

class _PanierPageState extends State<PanierPage> {
  Widget _buildRow(CartItem item) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.2,
          child: Image.network(item.article.image),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              utf8.decode(item.article.title.codeUnits),
              style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              "Prix: ${item.article.price}€",
              style: const TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(
          child: Row(
            children: [
              IconButton(
                  onPressed: () => decrementQuantity(item),
                  icon: const Icon(Icons.delete, color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }

  void decrementQuantity(CartItem item) {
    setState(() {
      widget._cart.removeProduct(item.article);
    });
  }

  void buyPanier() {
    widget._cart.clearCart();
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Merci pour votre achat !"),
    ));
  }

  double totalCart() {
    double sum = 0;
    for (CartItem item in widget._cart.items) {
      sum += item.article.price;
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarLayout.buildAppBar(widget.title, context, widget._cart),
      body: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Center(
          child: widget._cart.items.isNotEmpty
              ?
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListView.builder(
                  itemCount: widget._cart.items.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      _buildRow(widget._cart.items[index]),
                  itemExtent: 180,
                ),
                Column(
                  children: [
                    Text("Sous-total: ${totalCart()}€", style: const TextStyle(color: Colors.white),),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(AppStyle.goldColor)),
                      onPressed: () => buyPanier(),
                      child: const Text("Valider le panier", style: TextStyle(color: Colors.white),),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20)),
                  ],
                )
              ],
            ),
          ) : Column(
                  children: [
                    Text("Votre panier est vide !",
                        style: AppStyle.pageTitleTextStyle.copyWith(color: Colors.white)),
                  ],
                ),
        ),
      ),
    );
  }
}
