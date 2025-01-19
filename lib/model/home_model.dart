class HomeModel {
  bool? status;
  HomeDataModel? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
}

class HomeDataModel {
  List<Banners>? banners = [];
  List<Products>? products = [];

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      json['banners'].forEach((element) {
        banners!.add(Banners.fromJson(element));
      });
    }
    if (json['products'] != null) {
      json['products'].forEach((element) {
        products!.add(Products.fromJson(element));
      });
    }
  }
}

class Banners {
  int? id;
  String? image;

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class Products {
  int? id;
  double? price;
  double? oldPrice;
  double? discount;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = (json['price'] as num).toDouble(); // Convert to double
    oldPrice = (json['old_price'] as num).toDouble(); // Convert to double
    discount = (json['discount'] as num).toDouble(); // Convert to double
    image = json['image'];
    name = json['name'];
    images = List<String>.from(json['images']);
    description = json['description'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
