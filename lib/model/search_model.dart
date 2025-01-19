class SearchModel {
  bool? status;
  SearchData? data;

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? SearchData.fromJson(json['data']) : null;
  }
}

class SearchData {
  int? total;
  List<Data> data = [];

  SearchData.fromJson(Map<String, dynamic> json) {
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
  dynamic price;
  String? image;
  String? name;
  String? description;
  bool? inFavorites;
  bool? inCart;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
