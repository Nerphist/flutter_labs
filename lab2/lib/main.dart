import 'package:flutter/material.dart';
import 'package:lab2/state/cart_state.dart';
import 'package:lab2/views/cart_view.dart';
import 'package:provider/provider.dart';
import 'data/data.dart';
import 'package:lab2/models/category_model.dart';
import 'package:lab2/models/product_model.dart';
import 'package:lab2/models/trending_product_model.dart';
import 'package:lab2/views/category_view.dart';
import 'package:lab2/views/product_view.dart';
import 'package:lab2/views/trending_view.dart';
import 'package:lab2/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CartState(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
            // This makes the visual density adapt to the platform that you run
            // the app on. For desktop platforms, the controls will be smaller and
            // closer together (more dense) than on mobile platforms.
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Home(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TrendingProductModel> trendingProducts = new List();
  List<ProductModel> products = new List();
  List<CategoryModel> categories = new List();
  @override
  void initState() {
    super.initState();
    trendingProducts = getTrendingProducts();
    products = getProducts();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          offset: Offset(5.0, 5.0),
                          blurRadius: 5.0,
                          color: Colors.black87.withOpacity(0.05),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 9),
                          child: Text(
                            "Search",
                            style: TextStyle(
                                color: Color(0xff9B9B9B), fontSize: 17),
                          ),
                        ),
                        Icon(Icons.search),
                      ],
                    ),
                  ),
                  flex: 8,
                ),
                Flexible(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new CartView()));
                      },
                      child: Stack(children: [
                        Container(
                          width: 30.0,
                          child: IconButton(
                            icon: Icon(Icons.shopping_cart),
                            color: Colors.black,
                            onPressed: null,
                          ),
                        ),
                        Positioned(
                          top: 20.0,
                          right: 10.0,
                          child: Stack(children: <Widget>[
                            Icon(Icons.brightness_1,
                                size: 20.0,
                                color: Color(0xff8EA2FF).withOpacity(0.8)),
                            Positioned(
                                top: 4.0,
                                right: 6.0,
                                child: Center(
                                    child: Consumer<CartState>(
                                  builder: (context, cartState, child) => Text(
                                    '${cartState.products.length}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ))),
                          ]),
                        )
                      ])),
                  flex: 1,
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),

            // Trending
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Today Trending",
                    style: TextStyle(color: Colors.black87, fontSize: 22),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Text("October 6")
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 22),
              height: 150,
              child: ListView.builder(
                  itemCount: trendingProducts.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return TrendingView(
                      product: trendingProducts[index],
                    );
                  }),
            ),

            SizedBox(
              height: 40,
            ),

            // New arrivals
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "New arrivals",
                    style: TextStyle(color: Colors.black87, fontSize: 22),
                  ),
                  SizedBox(
                    width: 130,
                  ),
                  Text("amazon gift cards")
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 240,
              padding: EdgeInsets.only(left: 22),
              child: ListView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ProductView(product: products[index]);
                  }),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                "Top categories",
                style: TextStyle(color: Colors.black87, fontSize: 22),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 240,
              padding: EdgeInsets.only(left: 22),
              child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CategoryView(
                      category: categories[index],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
