import 'package:td_flutter/Models/Article.dart';

class CartItem {
  final Article _article;

  CartItem(this._article);

  Article get article => _article;
}

class Cart {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  CartItem getCartItem(int index) {
    return this._items[index];
  }

  void addProduct(Article article) {
    int index = findCartItemIndex(article.id);
    if (index == -1) {
      _items.add(CartItem(article));
    }
  }

  void removeProduct(Article article) {
    int index = findCartItemIndex(article.id);
    if (index != -1) {
      _items.removeAt(index);
    }
  }

  void clearCart(){
    this._items.clear();
  }

  int totalItems() {
    return _items.length;
  }

  int findCartItemIndex(int id) {
    return _items.indexWhere((element) => element._article.id == id);
  }
}
