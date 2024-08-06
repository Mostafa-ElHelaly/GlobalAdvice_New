abstract class ResetEvent {}

class CarinsuranceblocEvent extends ResetEvent {
  int? price;
  String? isLicensed;
  int? motorBrands;
  int? motorDeductibles;
  int? motorManufactureYear;
  String? phone;
  CarinsuranceblocEvent({
    this.price,
    this.isLicensed,
    this.motorBrands,
    this.motorDeductibles,
    this.motorManufactureYear,
    this.phone,
  });
}
