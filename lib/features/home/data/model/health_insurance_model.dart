class HealthInsuranceModel {
  String? uid;
  String? organizationId;
  String? planId;
  String? name;
  String? age;
  String? relation;
  String? price;
  String? gende;

  HealthInsuranceModel(
      {this.uid,
      this.organizationId,
      this.planId,
      this.name,
      this.age,
      this.relation,
      this.price,
      this.gende});

  HealthInsuranceModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    organizationId = json['organization_id'];
    planId = json['plan_id'];
    name = json['name'];
    age = json['age'];
    relation = json['relation'];
    price = json['price'];
    gende = json['gende'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['organization_id'] = this.organizationId;
    data['plan_id'] = this.planId;
    data['name'] = this.name;
    data['age'] = this.age;
    data['relation'] = this.relation;
    data['price'] = this.price;
    data['gende'] = this.gende;
    return data;
  }
}
