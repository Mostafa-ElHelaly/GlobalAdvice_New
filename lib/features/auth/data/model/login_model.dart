class LoginModel {
  int? id;
  String? name;
  String? password;
  String? confirmPassword;
  String? token;
  String? birthdate;
  String? gender;
  String? email;
  String? telephone;
  bool? isCompleted;
  int? banned;
  int? deleted;
  String? addstamp;
  String? updatestamp;

  LoginModel({
    this.id,
    this.name,
    this.password,
    this.confirmPassword,
    this.isCompleted,
    this.token,
    this.birthdate,
    this.gender,
    this.email,
    this.telephone,
    this.banned,
    this.deleted,
    this.addstamp,
    this.updatestamp,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    token = json['token'];
    isCompleted = json['isCompleted'];
    birthdate = json['birthdate'];
    gender = json['gender'];
    email = json['email'];
    telephone = json['telephone'];
    banned = json['banned'];
    deleted = json['deleted'];
    addstamp = json['addstamp'];
    updatestamp = json['updatestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    data['birthdate'] = this.birthdate;
    data['isCompleted'] = this.isCompleted;
    data['token'] = this.token;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    data['banned'] = this.banned;
    data['deleted'] = this.deleted;
    data['addstamp'] = this.addstamp;
    data['updatestamp'] = this.updatestamp;
    return data;
  }
}
