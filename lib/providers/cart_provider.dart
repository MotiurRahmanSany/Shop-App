import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> cart = [];
  int totalCartItems = 0;

  void addProduct(Map<String, dynamic> product) {
    cart.add(product);
    totalCartItems = cart.length;
    notifyListeners();
  }

  void undoDeleteProduct(int index, Map<String, dynamic> product) {
    cart.insert(index, product);
    totalCartItems = cart.length;
    print(totalCartItems);
    print(cart);
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> product) {
    cart.remove(product);
    totalCartItems = cart.length;
    notifyListeners();
  }
}
