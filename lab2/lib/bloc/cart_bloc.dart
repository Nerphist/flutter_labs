import 'dart:async';

import 'package:lab2/models/product_model.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc {
  final cartStreamController = BehaviorSubject<List>.seeded(new List());

  Stream get stream => cartStreamController.stream;

  void dispose() {
    cartStreamController.close();
  }

  List<ProductModel> cartItems = new List();

  void addToCart(item) {
    cartItems.add(item);
    cartStreamController.sink.add(cartItems);
  }

  void removeFromCart(item) {
    cartItems.remove(item);
    cartStreamController.sink.add(cartItems);
  }
}
