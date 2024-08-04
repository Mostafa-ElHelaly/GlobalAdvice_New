class OtherFormsModel {
  String? name;
  String? phonenumber;
  String? type;
  String? message;

  OtherFormsModel({this.name, this.phonenumber, this.type, this.message});

  OtherFormsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phonenumber = json['phonenumber'];
    type = json['type'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phonenumber'] = this.phonenumber;
    data['type'] = this.type;
    data['message'] = this.message;
    return data;
  }
}
