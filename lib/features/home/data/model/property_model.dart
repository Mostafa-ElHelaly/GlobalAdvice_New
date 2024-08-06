class PropertyModel {
  String uid;
  int buildingPrice;
  int contentPrice;
  String type;
  List<int> homeBenefits;
  String phone;
  String name;

  PropertyModel({
    required this.uid,
    required this.buildingPrice,
    required this.contentPrice,
    required this.type,
    required this.homeBenefits,
    required this.phone,
    required this.name,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      uid: json['uid'] as String,
      buildingPrice: json['building_price'] as int,
      contentPrice: json['content_price'] as int,
      type: json['type'] as String,
      homeBenefits: List<int>.from(json['homeBenefits']),
      phone: json['phone'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'building_price': buildingPrice,
      'content_price': contentPrice,
      'type': type,
      'homeBenefits': homeBenefits,
      'phone': phone,
      'name': name,
    };
  }
}
