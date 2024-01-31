import 'package:flutter/material.dart';
import 'package:td_flutter/Models/Cart.dart';
import 'package:td_flutter/UI/PanierPage.dart';

class AppBarLayout {
  static AppBar buildAppBar(String title, BuildContext context, Cart cart) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title:
      Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      actions: [
        IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PanierPage(cart, title: "Mon Panier"))),
            icon: const Icon(Icons.shopping_cart))
      ],
    );
  }
}