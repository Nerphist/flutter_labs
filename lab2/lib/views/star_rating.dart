import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int rating;
  StarRating({this.rating});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.asset(
          rating >= 1 ? "assets/star.png" : "assets/stargrey.png",
          width: 13,
          height: 13,
        ),
        SizedBox(
          width: 3,
        ),
        Image.asset(
          rating >= 2 ? "assets/star.png" : "assets/stargrey.png",
          width: 13,
          height: 13,
        ),
        SizedBox(
          width: 3,
        ),
        Image.asset(
          rating >= 3 ? "assets/star.png" : "assets/stargrey.png",
          width: 13,
          height: 13,
        ),
        SizedBox(
          width: 3,
        ),
        Image.asset(
          rating >= 4 ? "assets/star.png" : "assets/stargrey.png",
          width: 13,
          height: 13,
        ),
        SizedBox(
          width: 3,
        ),
        Image.asset(
          rating >= 5 ? "assets/star.png" : "assets/stargrey.png",
          width: 13,
          height: 13,
        ),
      ],
    );
  }
}
