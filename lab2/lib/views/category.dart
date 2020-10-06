import 'package:flutter/material.dart';

class CategoryView extends StatelessWidget {
  final String categoryName;
  final String imgAssetPath;
  final String color1;
  final String color2;
  CategoryView(
      {this.imgAssetPath, this.color2, this.color1, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 65,
            width: 110,
            margin: EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(int.parse(color1)),
                  Color(int.parse(color2))
                ]),
                borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
            child: Container(
                child: Image.asset(
              imgAssetPath,
            )),
          ),
          SizedBox(
            height: 8,
          ),
          Text(categoryName),
        ],
      ),
    );
  }
}
