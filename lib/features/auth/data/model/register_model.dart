class RegisterModel {
  int? status;
  String? statusText;
  String? error;

  String? token;

  RegisterModel({this.status, this.statusText, this.error, this.token});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusText = json['statusText'];
    error = json['error'];

    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusText'] = this.statusText;
    data['error'] = this.error;
    data['token'] = this.token;
    return data;
  }
}
