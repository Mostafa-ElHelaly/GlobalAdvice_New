// class LoginModel {
//   bool? isCompleted;
//   bool? isAuthenticated;
//   int? phone;
//   String? password;
//   String? confirmPassword;
//   String? token;
//   DateTime? expiresOn;
//   DateTime? refreshTokenExpiration;
//   int id;
//   String? name;
//   DateTime? birthdate;
//   String? gender;
//   String? email;
//
//   LoginModel({
//     required this.id,
//     this.name,
//     this.isCompleted,
//     this.isAuthenticated,
//     this.phone,
//     this.email,
//     this.password,
//     this.birthdate,
//     this.gender,
//     this.confirmPassword,
//     this.token,
//     this.expiresOn,
//     this.refreshTokenExpiration,
//   });
//
//   factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//         id: json["id"] ?? "",
//         isCompleted: json["iscomplated"] ?? false,
//         isAuthenticated: json["isAuthenticated"] ?? false,
//         phone: json["phone"] ?? "",
//         email: json["email"] ?? "",
//         password: json["password"] ?? "",
//         token: json["token"] ?? "",
//         expiresOn: DateTime.parse(json["expiresOn"] ?? ""),
//         refreshTokenExpiration:
//             DateTime.parse(json["refreshTokenExpiration"] ?? ""),
//         name: json["name"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "iscomplated": isCompleted,
//         "isAuthenticated": isAuthenticated,
//         "phone": phone,
//         "email": email,
//         "name": name,
//         "password": password,
//         "token": token,
//         "expiresOn": expiresOn!.toIso8601String(),
//         "refreshTokenExpiration": refreshTokenExpiration!.toIso8601String(),
//       };
// }

class LoginModel {
  int? id;
  String? name;
  String? birthdate;
  String? gender;
  String? email;
  String? telephone;
  int? banned;
  int? deleted;
  String? addstamp;
  String? updatestamp;

  bool? isAuthenticated;
  String? token;
  DateTime? expiresOn;
  DateTime? refreshTokenExpiration;

  LoginModel({
    this.id,
    this.name,
    this.birthdate,
    this.gender,
    this.email,
    this.telephone,
    this.banned,
    this.deleted,
    this.addstamp,
    this.updatestamp,
    this.isAuthenticated,
    this.token,
    this.expiresOn,
    this.refreshTokenExpiration,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    birthdate = json['birthdate'];
    gender = json['gender'];
    email = json['email'];
    telephone = json['telephone'];
    banned = json['banned'];
    deleted = json['deleted'];
    addstamp = json['addstamp'];
    updatestamp = json['updatestamp'];
    isAuthenticated = json['isAuthenticated'];
    token = json['token'];
    expiresOn = json['expiresOn'];
    refreshTokenExpiration = json['refreshTokenExpiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['birthdate'] = this.birthdate;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    data['banned'] = this.banned;
    data['deleted'] = this.deleted;
    data['addstamp'] = this.addstamp;
    data['updatestamp'] = this.updatestamp;
    data['isAuthenticated'] = this.isAuthenticated;
    data['token'] = this.token;
    data['expiresOn'] = this.expiresOn;
    data['refreshTokenExpiration'] = this.refreshTokenExpiration;
    return data;
  }
}
