class Coffee {
  final String title;
  final String image;
  final String subTitle;
  final String description;
  final int quantity;
  final bool isFav;
  final String price;

  Coffee({
    required this.title,
    required this.image,
    required this.subTitle,
    required this.description,
    required this.quantity,
    required this.isFav,
    required this.price,
  });

  factory Coffee.fromJson(Map<String, dynamic> json) {
    return Coffee(
      title: json['title'],
      image: json['image'],
      subTitle: json['subTitle'],
      description: json['description'],
      quantity: json['quantity'],
      isFav: json['isFav'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'image': image,
      'subTitle': subTitle,
      'description': description,
      'quantity': quantity,
      'isFav': isFav,
      'price': price,
    };
  }
}

class CoffeeData {
  final List<Coffee> data;

  CoffeeData({required this.data});

  factory CoffeeData.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Coffee> dataList = list.map((i) => Coffee.fromJson(i)).toList();
    return CoffeeData(data: dataList);
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((v) => v.toJson()).toList(),
    };
  }
}
