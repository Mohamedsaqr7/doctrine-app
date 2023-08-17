class Docpatient {
  List<PatientInformation> ?patinfo;
  Docpatient({this.patinfo});
  Docpatient.fromJson(Map<String, dynamic> json) {
    if (json['patinfo'] != null) {
      patinfo = <PatientInformation>[];
      json['patinfo'].forEach((v) {
        patinfo!.add(PatientInformation.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
  if (patinfo != null) {
      data['patinfo'] = patinfo!.map((v) => v.toJson()).toList();
    }   
    return data;
  }
}


class PatientInformation {
  int? id;
  String? name;
  String? date_of_birth;
  String? diagnosis;
  String? address;
  String? visit_time;
  PatientInformation(
      {this.id,
      this.name,
      this.address,
      this.date_of_birth,
      this.diagnosis,
      this.visit_time});
  PatientInformation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    date_of_birth = json['date_of_birth'];
    diagnosis = json['diagnosis'];
    address = json['address'];
    visit_time = json['visit_time'];
    id = json['id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['date_of_birth'] = date_of_birth;
    data['diagnosis'] = diagnosis;
    data['address'] = address;
    data['visit_time'] = visit_time;
    data['id'] = id;
    return data;
  }
}
