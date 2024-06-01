import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  String img;
  String title;
  String subTitle;
  String price;

   ItemWidget({
    super.key,
    required this.subTitle,
    required this.price,
    required this.title,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Image.asset(
              'assets/${img}',
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              subTitle,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '\$${price}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,

              ),
            ),
          ),
        ],
      ),
    );

  }
}
