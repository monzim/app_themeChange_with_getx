import 'package:app_theme_with_getx/controllers/cart_controller.dart';
import 'package:app_theme_with_getx/controllers/shopping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Expanded(child: GetX<ShoppingController>(builder: (_) {
          return ListView.builder(
              itemCount: _.shoppingItems.length,
              itemBuilder: (contex, index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _buildText(
                              text: _.shoppingItems[index].id.toString()),
                          _buildText(text: _.shoppingItems[index].productName),
                          _buildText(
                              text: _.shoppingItems[index].productPrice
                                  .toString()),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.network(_.shoppingItems[index].productImg,
                                width: 100, height: 100),
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                              onPressed: () {
                                cartController
                                    .addToCart(_.shoppingItems[index]);
                              },
                              icon: Icon(Icons.add_shopping_cart)),
                          SizedBox(width: 10),
                          IconButton(
                              onPressed: () {
                                _.shoppingItems[index].isFavorite.toggle();
                                print(_.shoppingItems[index].isFavorite.value);
                              },
                              icon: Obx(() => Icon(
                                    !_.shoppingItems[index].isFavorite.value
                                        ? Icons.check_box_outline_blank
                                        : Icons.check_box_outlined,
                                  )))
                        ],
                      )
                    ],
                  ),
                );
              });
        })),
        Expanded(
            child: ListView.builder(
                itemCount: shoppingController.shoppingItems.length,
                itemBuilder: (contex, index) {
                  return Column(
                    children: <Widget>[
                      shoppingController.shoppingItems[index].isFavorite.value
                          ? Obx(() => Text('fav'))
                          : Obx(() => Text("No")),
                    ],
                  );
                })),
        GetX<CartController>(builder: (_) {
          return _buildText(
            text: 'Total price: ${_.totalPrice} \$',
            fontsize: 24,
            color: Colors.redAccent,
            fontWeight: FontWeight.w600,
          );
        })
      ]),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart),
          label: GetX<CartController>(builder: (_) {
            return _buildText(
                text: _.count.toString(),
                fontsize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w600);
          })),
    );
  }
}

Text _buildText(
    {required String text,
    double? fontsize,
    FontWeight? fontWeight,
    Color? color}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: fontsize ?? 18,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? Colors.black,
    ),
  );
}
