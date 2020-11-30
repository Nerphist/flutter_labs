import 'package:flutter/material.dart';
import 'package:lab2/models/product_model.dart';

class ProductStandalone extends StatelessWidget {
  static const routeName = '/productStandalone';

  @override
  Widget build(BuildContext context) {
    final ProductModel model = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: Center(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Image.asset(
              model.imgUrl,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Text(model.productName),
            SizedBox(
              height: 10,
            ),
            Text('\$' + model.price.toString()),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 25,
                width: 100,
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: LinearGradient(colors: [
                      const Color(0xff8EA2FF).withOpacity(0.5),
                      const Color(0xff557AC7).withOpacity(0.5)
                    ])),
                child: Text(
                  "Go back",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
