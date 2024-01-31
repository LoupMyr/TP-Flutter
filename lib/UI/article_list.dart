import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:td_flutter/Models/Article.dart';
import 'package:td_flutter/Controllers/ArticleController.dart';
import 'package:td_flutter/Models/Cart.dart';

class ArticleList extends StatefulWidget {
  final Cart _cart;
  const ArticleList(this._cart, {super.key});

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {

  List<Article> _articles = [];

  Future<List<Article>> getArticles() async{
    _articles = await ArticleController.getArticles();
    return _articles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liste articles')),
      backgroundColor: Colors.black,
      body: FutureBuilder<List<Article>>(
        future: getArticles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return _buildRow(snapshot.data![index]);
              },
            );
          }else{
            return Column(children: [],);
          }
        },
      ),
    );
  }

  _buildRow(Article article) {
    return Card(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(article.title,
            style: TextStyle(fontFamily: 'Montserrat', fontSize: 25, color: Color.fromRGBO(212, 175, 55, 1)),),
            //subtitle: Text(article.description),
            //leading: Icon(Icons.local_pizza),

          Image.network(
            '${article.image}',
            height: 550,
            width: 300,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(4.0),
            child: Text(article.description),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red.shade800)
                ),
                child: Row(
                  children: [
                    Icon(Icons.shopping_cart),
                    SizedBox(width: 5),
                    Text("Details"),
                  ],
                ),
                onPressed: (){
                  print('Voir détails');
                },
              )
            ],
          ),
        ],
      ),
    );

  }







}
