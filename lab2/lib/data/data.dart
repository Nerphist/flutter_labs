import 'package:lab2/models/category_model.dart';
import 'package:lab2/models/product_model.dart';
import 'package:lab2/models/trending_product_model.dart';

List<TrendingProductModel> getTrendingProducts() {
  List<TrendingProductModel> trendingProducts =
      new List<TrendingProductModel>();
  TrendingProductModel productModel = new TrendingProductModel();

  productModel.storeName = "Kiev";
  productModel.productName = "Valentine's day";
  productModel.ratingQuantity = 1;
  productModel.rating = 4;
  productModel.imgUrl = "assets/valentine.jpg";
  productModel.price = 75;
  trendingProducts.add(productModel);
  productModel = new TrendingProductModel();

  productModel.storeName = "Kiev";
  productModel.productName = "Happy birthday";
  productModel.ratingQuantity = 3;
  productModel.imgUrl = "assets/image.png";
  productModel.rating = 4;
  productModel.price = 30;
  trendingProducts.add(productModel);
  productModel = new TrendingProductModel();
  return trendingProducts;
}

List<ProductModel> getProducts() {
  List<ProductModel> products = new List();
  ProductModel productModel = new ProductModel();

  productModel.productName = "Special  gift card";
  productModel.ratingQuantity = 20;
  productModel.imgUrl = "";
  productModel.rating = 3;
  productModel.price = 5;
  products.add(productModel);
  productModel = new ProductModel();

  productModel.productName = "Special  gift card";
  productModel.ratingQuantity = 1;
  productModel.imgUrl = "";
  productModel.rating = 2;
  productModel.price = 10;
  products.add(productModel);
  productModel = new ProductModel();

  productModel.productName = "Special  gift card";
  productModel.ratingQuantity = 6;
  productModel.imgUrl = "";
  productModel.rating = 5;
  productModel.price = 15;
  products.add(productModel);
  productModel = new ProductModel();

  productModel.productName = "Special  gift card";
  productModel.ratingQuantity = 4;
  productModel.imgUrl = "";
  productModel.rating = 3;
  productModel.price = 20;
  products.add(productModel);
  productModel = new ProductModel();

  productModel.productName = "Special  gift card";
  productModel.ratingQuantity = 2;
  productModel.imgUrl = "";
  productModel.rating = 5;
  productModel.price = 50;
  products.add(productModel);
  productModel = new ProductModel();

  productModel.productName = "Special  gift card";
  productModel.ratingQuantity = 1;
  productModel.imgUrl = "";
  productModel.rating = 5;
  productModel.price = 100;
  products.add(productModel);
  productModel = new ProductModel();
  return products;
}

List<CategoryModel> getCategories() {
  List<CategoryModel> categories = new List();
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = "Regular Gift";
  categoryModel.color1 = "0xff8EA2FF";
  categoryModel.color2 = "0xff557AC7";
  categoryModel.imgAssetPath = "assets/category.png";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Box Gift";
  categoryModel.color1 = "0xff50F9B4";
  categoryModel.color2 = "0xff38CAE9";
  categoryModel.imgAssetPath = "assets/boxgift.png";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Sweet presents";
  categoryModel.color1 = "0xffFFB397";
  categoryModel.color2 = "0xffF46AA0";
  categoryModel.imgAssetPath = "assets/choclate.png";
  categories.add(categoryModel);
  categoryModel = new CategoryModel();

  return categories;
}
