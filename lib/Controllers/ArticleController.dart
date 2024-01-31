import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:td_flutter/Models/Article.dart';

class ArticleController {
  static Future<List<Article>> getArticles() async {
    List<Article> lesArticles = [];
    var response = await http.get(
      Uri.parse('https://65b907e2b71048505a8a06c0.mockapi.io/api/prints'),
    );
    if (response.statusCode == 200) {
      var articles = convert.jsonDecode(response.body);
      for (var elt in articles) {
        Article article = Article(int.parse(elt["id"].toString()), elt["title"], elt["description"],
            elt["image"], double.parse(elt["price"].toString()), elt["size"], elt["collection"]);
        lesArticles.add(article);
      }
    }
    return lesArticles;
  }
}
