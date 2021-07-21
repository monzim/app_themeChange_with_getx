import 'package:get/get.dart';

class Products {
  final int id;
  final String productName;
  final String productImg;
  final double productPrice;

  Products({
    required this.id,
    required this.productName,
    required this.productImg,
    required this.productPrice,
  });

  final isFavorite = false.obs;
}
