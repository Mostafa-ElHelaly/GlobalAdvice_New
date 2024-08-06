class CarInusranceRequest {
  int? price;
  String? isLicensed;
  int? motorBrands;
  int? motorDeductibles;
  int? motorManufactureYear;
  String? phone;

  // Constructor
  CarInusranceRequest({
    required this.price,
    required this.isLicensed,
    required this.motorBrands,
    required this.motorDeductibles,
    required this.motorManufactureYear,
    required this.phone,
  });

  // Factory method to create an instance from JSON
  CarInusranceRequest.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    isLicensed = json['is_licensed']; // Convert 1 to true
    motorBrands = json['motorBrands'];
    motorDeductibles = json['motorDeductibles'];
    motorManufactureYear = json['motorManufactureYear'];
    phone = json['phone'];
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.price;
    data['service'] = this.isLicensed;
    data['name'] = this.motorBrands;
    data['name_alt'] = this.motorDeductibles;
    data['multiple'] = this.motorManufactureYear;
    data['plan_multiple'] = this.phone;

    return data;
  }
}
