import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  final List items = [].obs;

  void addToCart({
    required String name,
    required String image,
    required String price,

  }){
    List newItem =[
      {
        'name':name,
        'img':image,
        'price':price,
      }
    ];
    debugPrint('add item successful ${newItem.toString()}');
    items.addAll(newItem);
  }

  void removeFromCart(){
    items.removeLast();
  }
}