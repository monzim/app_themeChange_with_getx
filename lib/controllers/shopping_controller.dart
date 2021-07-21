import 'package:app_theme_with_getx/models/products.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var shoppingItems = <Products>[].obs;

  @override
  void onInit() {
    super.onInit();
    serverRequest();
  }

  void serverRequest() async {
    await Future.delayed(Duration(seconds: 2));

    var serverResponse = [
      Products(
        id: 1,
        productName: 'watch',
        productImg:
            'https://images.unsplash.com/photo-1624985945964-7e50eea25356?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
        productPrice: 20.00,
      ),
      Products(
        id: 2,
        productName: 'key',
        productImg:
            'https://images.unsplash.com/photo-1624985945964-7e50eea25356?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
        productPrice: 40.00,
      ),
      Products(
        id: 3,
        productName: 'Usb',
        productImg:
            'https://images.unsplash.com/photo-1624985945964-7e50eea25356?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
        productPrice: 50.00,
      ),
    ];

    shoppingItems.value = serverResponse;
  }
}
