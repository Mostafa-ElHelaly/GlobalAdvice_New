class LoginModel {
  bool? isCompleted;
  dynamic message;
  bool? isAuthenticated;
  int? telephone;
  String? password;
  String? confirmPassword;
  List<String>? roles;
  String? token;
  DateTime? expiresOn;
  DateTime? refreshTokenExpiration;
  String? id;
  String? name;
  String? birthdate;
  String? gender;
  String? email;
  int? banned;
  int? deleted;
  String? addstamp;
  String? updatestamp;

  LoginModel({
    this.id,
    this.isCompleted,
    this.message,
    this.isAuthenticated,
    this.telephone,
    this.email,
    this.password,
    this.birthdate,
    this.gender,
    this.confirmPassword,
    this.roles,
    this.token,
    this.expiresOn,
    this.refreshTokenExpiration,
    this.banned,
    this.deleted,
    this.addstamp,
    this.updatestamp,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        id: json["id"] ?? "",
        isCompleted: json["iscomplated"] ?? false,
        message: json["message"],
    banned: json["banned"],
    deleted: json["deleted"],
    addstamp: json["addstamp"],
    updatestamp: json["updatestamp"],
        isAuthenticated: json["isAuthenticated"] ?? false,
    telephone: json["telephone"],
        email: json["email"] ?? "",
        password: json["password"] ?? "",
        roles: json["roles"] != null
            ? List<String>.from(json["roles"].map((x) => x))
            : [],
        token: json["token"] ?? "",
        expiresOn: DateTime.parse(json["expiresOn"] ?? ""),
        refreshTokenExpiration:
            DateTime.parse(json["refreshTokenExpiration"] ?? ""),



      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "iscomplated": isCompleted,
        "message": message,
        "banned": banned,
        "deleted": deleted,
        "addstamp": addstamp,
        "updatestamp": updatestamp,
        "isAuthenticated": isAuthenticated,
        "telephone": telephone,
        "email": email,
        "password": password,
        "roles": List<dynamic>.from(roles!.map((x) => x)),
        "token": token,
        "expiresOn": expiresOn!.toIso8601String(),
        "refreshTokenExpiration": refreshTokenExpiration!.toIso8601String(),
      };
}
