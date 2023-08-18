class PersonModel {
  String? data;
  String? message;
  int? code;
  String? token;
  String? error;
  List<Information>? infos;
  PersonModel({this.data, this.message, this.code, this.error, this.infos});

  PersonModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
    token = json['token'];
    code = json['code'];
    error = json['error'];
    if (json['infos'] != null) {
      infos = <Information>[];
      json['infos'].forEach((v) {
        infos!.add(Information.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = this.data;
    data['message'] = message;
    data['token'] = token;
    data['code'] = code;
    data['error'] = error;
    if (infos != null) {
      data['infos'] = infos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Information {
  String? name;
  
  String? image;
  double? age;
  String? password;
  String? email;
  String? address;
  String? title;
  String? description;
  int? id;
  Information(
      {required this.name,
      this.age,
      this.title,
      this.password,
      this.address,
      this.image,
      this.email,
      this.description,
      required this.id});
  Information.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    password = json['password'];
    age = json['age'];
    email = json['email'];
    address = json['address'];
    title = json['title'];
    description = json['description'];
    id = json['id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    data['password'] = password;
    data['title'] = title;
    data['image'] = image;
    data['address'] = address;
    data['email'] = email;
    data['description'] = description;
    data['id'] = id;
    return data;
  }
}
