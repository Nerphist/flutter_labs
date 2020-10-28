import 'package:flutter/material.dart';
import 'package:lab2/models/product_model.dart';
import 'package:lab2/resources/colors.dart';
import 'package:lab2/views/star_rating.dart';

class ProductView extends StatelessWidget {
  final ProductModel product;
  ProductView({this.product});
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
                  "assets/amazon-gift-card.png",
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
              ],
            ),
          ),
          Text(product.productName),
          SizedBox(
            height: 8,
          ),
          Row(
            children: <Widget>[
              StarRating(
                rating: product.rating,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "(${product.ratingQuantity})",
                style: TextStyle(color: textGrey, fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }
}
