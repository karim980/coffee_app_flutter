import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartController _cartController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Obx(() => Column(
        children: [
          ElevatedButton(onPressed: (){
            _cartController.removeFromCart();
          }, child: Text('remove')),
          Expanded(
            child: ListView.builder(
              itemCount: _cartController.items.length,
              itemBuilder: (context, index) {
                final item = _cartController.items[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text(item['price']),
                  leading: Image.asset(item['img']),
                );
              },
            ),
          ),
        ],
      ))
    );
  }
}