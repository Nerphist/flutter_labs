import 'package:flutter/material.dart';
import 'package:lab2/bloc/cart_bloc.dart';
import 'package:lab2/utils/coronavirus_api.dart';
import 'package:lab2/views/cart_view.dart';
import 'package:lab2/views/product_standalone.dart';
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
    return MultiProvider(
        providers: [
          Provider<CartBloc>(create: (_) => CartBloc()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => Home(),
            ProductStandalone.routeName: (context) => ProductStandalone(),
          },
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
              height: 23,
            ),
            Center(
                child: GestureDetector(
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
                  "Go back",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () {
                Navigator.pop(
                  context,
                );
              },
            )),
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
                                child: Consumer<CartBloc>(
                                  builder: (context, cartBloc, child) {
                                    return StreamBuilder(
                                      initialData: new List(),
                                      stream: cartBloc.stream,
                                      builder: (context, snapshot) {
                                        int len;
                                        len = snapshot.data.length;
                                        return Text(
                                          '$len',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 11.0,
                                              fontWeight: FontWeight.w500),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ]),
                        )
                      ])),
                  flex: 1,
                )
              ],
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 25),
                child: FutureBuilder<int>(
                  future: getLatestConfirmed(),
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    var infoText = 'Be aware!\nConfirmed corona cases: ';
                    var confirmedCases = '';
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      confirmedCases = 'more then a minute ago!';
                    } else {
                      if (!snapshot.hasError)
                        confirmedCases = snapshot.data.toString();
                    }
                    return Text(infoText + confirmedCases);
                  },
                )),
            Padding(
                padding: const EdgeInsets.only(left: 25),
                child: FutureBuilder<int>(
                  future: getLatestDead(),
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    var infoText = 'People passed away: ';
                    var confirmedCases = '';
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      confirmedCases = 'too many';
                    } else {
                      if (!snapshot.hasError)
                        confirmedCases = snapshot.data.toString();
                    }
                    return Text(infoText + confirmedCases);
                  },
                )),
            SizedBox(
              height: 10,
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
