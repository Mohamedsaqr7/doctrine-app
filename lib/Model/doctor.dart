class DoctorModel {
  String? data;
  String? message;
  int? code;
  String? token;
  String? error;
 List <Information>? informations;
  DoctorModel({this.data,
   this.message, this.code,
    this.error, this.informations});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
    token = json['token'];
    code = json['code'];
    error = json['error'];
if (json['informations'] != null) {
      informations = <Information>[];
      json['informations'].forEach((v) {
        informations!.add(Information.fromJson(v));
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
if (informations != null) {
      data['informations'] = informations!.map((v) => v.toJson()).toList();
    }   
    return data;
  }
}

class Information {
  int? id;
  String? name;
  String? email;
  String? password;
  String? title;
  String? address;
  String? type;
  Information(
      {
      this.id,
        this.name,
      this.email,
      this.password,
      this.title,
      this.address,
      this.type,
      });
  Information.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    title = json['title'];
    address = json['address'];
    type = json['type'];
    id = json['id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    data['password'] = password;
    data['title'] = title;
    data['address'] = address;
    data['email'] = email;
    data['id'] = id;
    return data;
  }
}
