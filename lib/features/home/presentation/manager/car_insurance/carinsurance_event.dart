abstract class ResetEvent {}

class CarinsuranceblocEvent extends ResetEvent {
  String? uid;
  int? price;
  String? isLicensed;
  int? motorBrands;
  int? motorDeductibles;
  int? motorManufactureYear;
  int? phone;
  CarinsuranceblocEvent({
    this.uid,
    this.price,
    this.isLicensed,
    this.motorBrands,
    this.motorDeductibles,
    this.motorManufactureYear,
    this.phone,
  });
}
