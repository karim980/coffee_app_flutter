import 'package:coffee_app/controller/cart_controller.dart';
import 'package:coffee_app/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  Get.put<CartController>(CartController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: BindingsBuilder(() {
        Get.put<CartController>(CartController());
      }),
      theme: ThemeData.dark(
        useMaterial3: true
      ),
      home: HomeScreen(),
    );
  }
}
