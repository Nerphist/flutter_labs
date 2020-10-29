import 'package:flutter/material.dart';
import 'package:lab2/bloc/cart_bloc.dart';
import 'package:lab2/models/product_model.dart';
import 'package:provider/provider.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartBloc>(
      builder: (context, cartBloc, child) {
        return StreamBuilder(
          stream: cartBloc.stream,
          initialData: new List(),
          builder: (context, snapshot) {
            return Scaffold(
              body: Container(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(snapshot.data.length, (index) {
                      return CartItemView(
                        product: snapshot.data[index],
                      );
                    }),
                  ),
                ),
              ),
            );
          },
        );
      },
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
                    var bloc = context.read<CartBloc>();
                    bloc.removeFromCart(product);
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
