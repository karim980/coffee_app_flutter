import 'package:coffee_app/view/widget/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/coffee_model.dart';
import '../model/fake_data(coffee).dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  CoffeeData coffeeData = CoffeeData.fromJson(fakeData);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.sort)),
        actions: [
          IconButton(onPressed: () {
          }, icon: Icon(Icons.search_rounded))
        ],
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: DefaultTabController(
              length: 1, // Number of tabs
              child: Column(
                children: [
                  Text('Its a greate day for coffee'),
                  const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                        labelText: 'Search',
                        hintText: 'Search for coffee...',
                        prefixIcon: Icon(Icons.search),

                      ),
                    ),
                  ),
                  TabBar(
                    labelColor: Colors.orange,
                    dividerHeight: 0,
                    tabs: [
                      Tab(text: 'Hot Coffee',),
                      Tab(text: 'cold Coffee'),
                      Tab(text: 'Cappuiccino'),

                    ],
                    indicatorColor: Colors.orange,
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of items per row
                        crossAxisSpacing: 10, // Spacing between items horizontally
                        mainAxisSpacing: 10, // Spacing between items vertically
                        childAspectRatio: 3 / 4, // Aspect ratio of each item
                      ),
                      itemCount: coffeeData.data.length,
                      itemBuilder: (context, index) {
                        Coffee coffee = coffeeData.data[index];
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsScreen(
                                img: coffee.image,
                                title: coffee.title,
                                description: coffee.description,
                                price: coffee.price),
                            ));
                          },
                          child: ItemWidget(
                              subTitle: coffee.subTitle,
                              price: coffee.price.toString(),
                              title: coffee.title,
                              img: coffee.image),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),


      bottomSheet: Container(
        height: 65,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.transparent,
              offset: const Offset(0, 0),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: Icon(
                Icons.home,
                size: 30,
                color: Colors.orange,
              ),
            ),
            InkWell(
              onTap: () {
                Get.defaultDialog(title: 'title');
              },
              child: Icon(
                Icons.favorite,
                size: 30,
                color: Colors.white,
              ),
            ),
            InkWell(
              child: Icon(
                Icons.notifications,
                size: 30,
                color: Colors.white,
              ),
            ),
            InkWell(
              child: Icon(
                Icons.person,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
