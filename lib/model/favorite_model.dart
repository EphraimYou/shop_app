class FavoriteModel {
  bool? status;
  FavoriteData? data;

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? FavoriteData.fromJson(json['data']) : null;
  }
}

class FavoriteData {
  int? total;
  List<Data> data = [];

  FavoriteData.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['data'] != null) {
      json['data'].forEach((element) {
        data.add(Data.fromJson(element));
      });
    }
  }
}

class Data {
  int? id;
  Product? product;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }
}

class Product {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
}

// class FavoriteModel {
//   bool? status;
//   FavoriteData? data;

//   FavoriteModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? FavoriteData.fromJson(json['data']) : null;
//   }
// }

// class FavoriteData {
//   int? total;
//   Data? favoriteData;

//   FavoriteData.fromJson(Map<String, dynamic> json) {
//     total = json['total'];
//     favoriteData = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
// }

// class Data {
//   int? id;
//   List<Products> products = [];

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     if (json['product'] != null) {
//       json['product'].forEach((element) {
//         products.add(Products.fromJson(element));
//       });
//     }
//   }
// }

// class Products {
//   int? id;
//   dynamic price;
//   dynamic oldPrice;
//   dynamic discount;
//   String? image;
//   String? name;
//   String? description;

//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     price = json['price'];
//     oldPrice = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//     name = json['name'];
//     description = json['description'];
//   }
// }
