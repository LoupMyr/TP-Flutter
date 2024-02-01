import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:td_flutter/Layout/AppBarLayout.dart';
import 'package:td_flutter/Models/Article.dart';
import 'package:td_flutter/Controllers/ArticleController.dart';
import 'package:td_flutter/Models/Cart.dart';

class ArticleList extends StatefulWidget {
  final Cart _cart;
  const ArticleList(this._cart,{super.key});

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
      appBar: AppBarLayout.buildAppBar("Liste article", context, widget._cart),
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

      color: Colors.black,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),


      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

           Text(article.title,
            style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 25,
                color: Color.fromRGBO(212, 175, 55, 1)
            ),
           ),


          Image.network(
            article.image,
            height: 550,
            width: 300,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                article.description,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white)
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.shopping_cart),
                      SizedBox(width: 5),
                      Text("Details",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 25,
                            color: Color.fromRGBO(212, 175, 55, 1)
                        ),
                      ),
                    ],
                  ),
                  onPressed: (){
                    print('Voir détails');
                  },
                )
              ],
            ),
          )

        ],
      ),
    );

  }


}
