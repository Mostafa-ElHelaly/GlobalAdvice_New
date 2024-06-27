

class LoginModel {
  int? id;
  String? name;
  bool? isCompleted;
  String? birthdate;
  String? gender;
  String? email;
  String? telephone;
  int? banned;
  int? deleted;
  String? addstamp;
  String? updatestamp;
  String? token;

  LoginModel(
      {this.id,
        this.name,
        this.birthdate,
        this.gender,
        this.email,
        this.telephone,
        this.banned,
        this.deleted,
        this.token,
        this.isCompleted,
        this.addstamp,
        this.updatestamp});

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    birthdate = json['birthdate'];
    gender = json['gender'];
    email = json['email'];
    telephone = json['telephone'];
    banned = json['banned'];
    deleted = json['deleted'];
    isCompleted = json['isCompleted'];
    addstamp = json['addstamp'];
    token = json['token'];
    updatestamp = json['updatestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['birthdate'] = this.birthdate;
    data['gender'] = this.gender;
    data['email'] = this.email;
    data['telephone'] = this.telephone;
    data['token'] = this.token;
    data['banned'] = this.banned;
    data['deleted'] = this.deleted;
    data['isCompleted'] = this.isCompleted;
    data['addstamp'] = this.addstamp;
    data['updatestamp'] = this.updatestamp;
    return data;
  }
}