class PropertyModel {
  String? uid;
  int? buildingPrice;
  int? contentPrice;
  String? type;
  List<int>? homeBenefits;
  String? phone;

  PropertyModel({
    this.uid,
    this.buildingPrice,
    this.contentPrice,
    this.type,
    this.homeBenefits,
    this.phone,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      uid: json['uid'] as String,
      buildingPrice: json['building_price'] as int,
      contentPrice: json['content_price'] as int,
      type: json['type'] as String,
      homeBenefits: List<int>.from(json['homeBenefits']),
      phone: json['phone'] as String,
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
    };
  }
}
