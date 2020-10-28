import 'package:flutter/material.dart';
import 'package:lab2/models/category_model.dart';

class CategoryView extends StatelessWidget {
  final CategoryModel category;
  CategoryView({this.category});
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
                  Color(int.parse(category.color1)),
                  Color(int.parse(category.color2))
                ]),
                borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
            child: Container(
                child: Image.asset(
              category.imgAssetPath,
            )),
          ),
          SizedBox(
            height: 8,
          ),
          Text(category.categoryName),
        ],
      ),
    );
  }
}
