import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lab2/models/product_model.dart';

class ProductStandalone extends StatefulWidget {
  static const routeName = '/productStandalone';

  @override
  _ProductStandaloneState createState() => _ProductStandaloneState();
}

class _ProductStandaloneState extends State<ProductStandalone>
    with TickerProviderStateMixin {
  Animation _priceAnimation, _heartAnimation;
  AnimationController _priceAnimationController, _heartAnimationController;

  @override
  void initState() {
    super.initState();
    _priceAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _priceAnimation =
        Tween(begin: 0.0, end: pi).animate(_priceAnimationController);

    _heartAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _heartAnimation = Tween(begin: 150.0, end: 170.0).animate(CurvedAnimation(
        curve: Curves.bounceOut, parent: _heartAnimationController));

    _heartAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _heartAnimationController.repeat();
      }
    });

    _priceAnimationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _priceAnimationController.repeat();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ProductModel model = ModalRoute.of(context).settings.arguments;
    _priceAnimationController.forward();
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
            AnimatedBuilder(
              animation: _priceAnimationController,
              builder: (context, child) => Transform.rotate(
                  angle: _priceAnimation.value,
                  child: Text('\$' + model.price.toString())),
            ),
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
            SizedBox(
              height: 10,
            ),
            beatingHeart()
          ],
        ),
      ),
    ));
  }

  Widget beatingHeart() {
    String animationText = 'Start heart';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: AnimatedBuilder(
            animation: _heartAnimationController,
            builder: (context, child) {
              return Center(
                child: Container(
                  child: Center(
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: _heartAnimation.value,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: OutlineButton(
              padding: const EdgeInsets.all(12.0),
              color: Colors.white,
              textColor: Colors.black,
              child: Text(animationText),
              onPressed: () {
                _heartAnimationController.forward();
              },
              splashColor: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
