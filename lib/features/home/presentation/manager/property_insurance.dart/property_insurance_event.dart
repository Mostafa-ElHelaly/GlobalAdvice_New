abstract class ResetEvent {}

class PropertyInsuranceBlocEvent extends ResetEvent {
  final String uid;
  final int buildingPrice;
  final int contentPrice;
  final String type;
  final List<int> homeBenefits;
  final String phone;
  final String name;

  PropertyInsuranceBlocEvent({
    required this.uid,
    required this.buildingPrice,
    required this.contentPrice,
    required this.type,
    required this.homeBenefits,
    required this.phone,
    required this.name,
  });
}
