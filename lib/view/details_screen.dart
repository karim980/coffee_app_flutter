import 'package:coffee_app/view/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';

class DetailsScreen extends StatelessWidget {
  final CartController _cartController = Get.find();
  String img;
  String title;
  String price;
  String description;

  DetailsScreen({
    super.key,
    required this.price,
    required this.title,
    required this.description,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
        child: Center(
          child: Column(
            children: [
              Expanded(
                  child: Image.asset(
                img,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width / 2,
              )),
              Expanded(flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text('Best Coffee',style: TextStyle(color: Colors.grey,fontSize: 18),),
                    ),
                    Row(
                      children: [
                        Text(title,style: TextStyle(fontSize: 24),),
                        Spacer(),
                        Text('\$${price}'),
                      ],
                    ),
                    Text(description,style: TextStyle(color: Colors.grey,fontSize: 10),),
                    Text('Volume: 60 ml'),
                    ElevatedButton(onPressed: (){
                      Get.to(CartScreen());
                    }, child: Text('cart')),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        _cartController.addToCart(name: title, image: img, price: price);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        elevation: 5,
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)
                        )
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
