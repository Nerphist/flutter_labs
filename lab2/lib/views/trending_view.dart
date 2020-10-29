import 'package:flutter/material.dart';
import 'package:lab2/bloc/cart_bloc.dart';
import 'package:lab2/models/trending_product_model.dart';
import 'package:lab2/resources/colors.dart';
import 'package:lab2/views/star_rating.dart';
import 'package:provider/provider.dart';

class TrendingView extends StatelessWidget {
  final TrendingProductModel product;

  TrendingView({this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      margin: EdgeInsets.only(right: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 15.0,
            color: Colors.black87.withOpacity(0.05),
          ),
        ],
      ),
      child: Row(
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
                  width: 50,
                  margin: EdgeInsets.only(left: 5, top: 5),
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
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  product.productName,
                  style: TextStyle(color: Colors.black87, fontSize: 19),
                ),
                Text(
                  product.storeName,
                  style: TextStyle(color: textGrey),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    StarRating(
                      rating: product.rating,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "(${product.ratingQuantity})",
                      style: TextStyle(color: textGrey, fontSize: 12),
                    )
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                GestureDetector(
                    onTap: () {
                      var cart = context.read<CartBloc>();
                      cart.addToCart(product);
                    },
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: LinearGradient(colors: [
                            const Color(0xff8EA2FF),
                            const Color(0xff557AC7)
                          ])),
                      child: Text(
                        "Add to cart",
                        style: TextStyle(color: Colors.white),
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
