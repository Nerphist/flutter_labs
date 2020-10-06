import 'product_model.dart';

class TrendingProductModel extends ProductModel {
  String storeName;
  TrendingProductModel(
      {int price,
      String productName,
      int rating,
      String imgUrl,
      int ratingQuantity,
      this.storeName})
      : super(
            productName: productName,
            price: price,
            rating: rating,
            imgUrl: imgUrl,
            ratingQuantity: ratingQuantity);
}
