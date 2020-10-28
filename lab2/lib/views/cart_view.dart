import 'package:flutter/material.dart';
import 'package:lab2/models/product_model.dart';
import 'package:lab2/state/cart_state.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartState state = context.watch<CartState>();
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(state.products.length, (index) {
              return CartItemView(
                product: state.products[index],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class CartItemView extends StatelessWidget {
  final ProductModel product;
  CartItemView({this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Column(
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Image.asset(
                  this.product.imgUrl,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 25,
                  width: 45,
                  margin: EdgeInsets.only(left: 8, top: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: LinearGradient(colors: [
                        const Color(0xff8EA2FF).withOpacity(0.5),
                        const Color(0xff557AC7).withOpacity(0.5)
                      ])),
                  child: Text(
                    "\$${product.price}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    var state = context.read<CartState>();
                    state.removeProduct(product);
                  },
                  child: Container(
                    height: 25,
                    width: 100,
                    margin: EdgeInsets.only(left: 20, top: 120),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        gradient: LinearGradient(colors: [
                          const Color(0xff8EA2FF).withOpacity(0.5),
                          const Color(0xff557AC7).withOpacity(0.5)
                        ])),
                    child: Text(
                      "Remove",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(product.productName),
          SizedBox(
            height: 7,
          )
        ],
      ),
    );
  }
}
