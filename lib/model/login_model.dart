class LoginModel {
  bool? status;
  String? message;
  UserData? data;
  // why we create class? because data json not regular data like status
  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    // we take json['data'] and send data to => Extract data from him
    // * can't be extract direct
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;
  int? points;
  int? credit;

  // named constructor
  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    token = json['token'];
    image = json['image'];
    phone = json['phone'];
    points = json['points'];
    credit = json['credit'];
    email = json['email'];
  }
}
