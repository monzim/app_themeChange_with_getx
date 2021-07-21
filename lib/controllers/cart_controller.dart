import 'package:app_theme_with_getx/models/products.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Products>[].obs;
  int get count => cartItems.length;
  double get totalPrice =>
      cartItems.fold(0, (sum, element) => sum + element.productPrice);

  addToCart(Products products) {
    cartItems.add(products);
    
  }
}
