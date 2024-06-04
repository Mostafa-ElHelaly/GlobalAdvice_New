// class LoginModel {
//   String? uid;
//   bool? isCompleted;
//   bool? hasDog;
//   dynamic message;
//   bool? isAuthenticated;
//   dynamic phoneNumber;
//   String? email;
//   List<String>? roles;
//   String? token;
//   DateTime? expiresOn;
//   DateTime? refreshTokenExpiration;
//
//   LoginModel({
//     required this.uid,
//     required this.isCompleted,
//     required this.hasDog,
//     required this.message,
//     required this.isAuthenticated,
//     required this.phoneNumber,
//     required this.email,
//     required this.roles,
//     required this.token,
//     required this.expiresOn,
//     required this.refreshTokenExpiration,
//   });
//
//   factory LoginModel.fromJson(Map<String, dynamic> json) =>
//       LoginModel(
//         uid: json["uid"]??"",
//         isCompleted: json["iscomplated"]??false,
//         hasDog: json["hasdog"]??false,
//         message: json["message"],
//         isAuthenticated: json["isAuthenticated"]??false,
//         phoneNumber: json["phoneNumber"],
//         email: json["email"]??"",
//         roles: json["roles"] != null ? List<String>.from(json["roles"].map((x) => x)) : [],
//         token: json["token"]??"",
//         expiresOn: DateTime.parse(json["expiresOn"]??""),
//         refreshTokenExpiration: DateTime.parse(json["refreshTokenExpiration"]??""),
//       );
//
//   Map<String, dynamic> toJson() => {
//     "uid": uid,
//     "iscomplated": isCompleted,
//     "hasdog": hasDog,
//     "message": message,
//     "isAuthenticated": isAuthenticated,
//     "phoneNumber": phoneNumber,
//     "email": email,
//     "roles": List<dynamic>.from(roles!.map((x) => x)),
//     "token": token,
//     "expiresOn": expiresOn!.toIso8601String(),
//     "refreshTokenExpiration": refreshTokenExpiration!.toIso8601String(),
//   };
// }