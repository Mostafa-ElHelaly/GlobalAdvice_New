class LoginModel {
  bool? isCompleted;
  bool? isAuthenticated;
  int? phone;
  String? password;
  String? confirmPassword;
  String? token;
  DateTime? expiresOn;
  DateTime? refreshTokenExpiration;
  int? id;
  String? name;
  int? birthdate;
  String? gender;
  String? email;



  LoginModel({
    this.id,
    this.name,
    this.isCompleted,
    this.isAuthenticated,
    this.phone,
    this.email,
    this.password,
    this.birthdate,
    this.gender,
    this.confirmPassword,
    this.token,
    this.expiresOn,
    this.refreshTokenExpiration,

  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["id"] ?? "",
        isCompleted: json["iscomplated"] ?? false,

        isAuthenticated: json["isAuthenticated"] ?? false,
        phone: json["phone"] ?? "",
        email: json["email"] ?? "",
        password: json["password"] ?? "",
        token: json["token"] ?? "",
        expiresOn: DateTime.parse(json["expiresOn"] ?? ""),
        refreshTokenExpiration:
            DateTime.parse(json["refreshTokenExpiration"] ?? ""),
        name: json["name"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "iscomplated": isCompleted,
        "isAuthenticated": isAuthenticated,
        "phone": phone,
        "email": email,
        "name": name,
        "password": password,
        "token": token,
        "expiresOn": expiresOn!.toIso8601String(),
        "refreshTokenExpiration": refreshTokenExpiration!.toIso8601String(),
      };
}
