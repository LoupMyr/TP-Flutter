import 'package:flutter/material.dart';
<<<<<<< HEAD:lib/HomePage.dart
import 'Models/menu.dart';

=======
import 'package:td_flutter/Controllers/ArticleController.dart';
import 'package:td_flutter/Layout/AppBarLayout.dart';
import 'package:td_flutter/Models/Article.dart';
import 'package:td_flutter/Models/Cart.dart';
>>>>>>> 46d95a99c3c787ce0b014d2ae5be69f1aca26c01:lib/UI/HomePage.dart

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Cart _cart = Cart();

  var _menus = [
    Menu(1, 'Collections 2024', 'art.jpg', Color.fromRGBO(212, 175, 55, 1), ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD:lib/HomePage.dart
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      Container(decoration: const BoxDecoration(
        color: Colors.black
      ),child: Center(
        child: ListView.builder(
          itemCount: _menus.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () => null,//Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage)),
            child: _buildRow(_menus[index]),
          ),
          itemExtent:180,
=======
      appBar: AppBarLayout.buildAppBar(widget.title, context, _cart),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          ],
>>>>>>> 46d95a99c3c787ce0b014d2ae5be69f1aca26c01:lib/UI/HomePage.dart
        ),
      ),)

    );
  }
}

@override

_buildRow(Menu menu) {
  return Container (
      height: 100,
      decoration: BoxDecoration(
        color: menu.color,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      margin: EdgeInsets.all(4.0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.asset(
              'assets/images/collections/${menu.image}',
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            height: 50,
            child: Center(
              child: Text(
                menu.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  fontSize: 28,
                ),
              ),
            ),
          ),
        ],
      )
  );
}