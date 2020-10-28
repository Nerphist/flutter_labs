import 'package:flutter/material.dart';
import 'package:lab2/models/product_model.dart';

class CartState with ChangeNotifier {
  List<ProductModel> products = new List();

  void addProduct(ProductModel product) {
    products.add(product);
    notifyListeners();
  }

  void removeProduct(ProductModel product) {
    products.remove(product);
    notifyListeners();
  }
}
