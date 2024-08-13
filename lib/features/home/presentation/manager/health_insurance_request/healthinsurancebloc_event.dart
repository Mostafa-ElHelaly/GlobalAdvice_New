abstract class ResetEvent {}

class HealthInsuranceBlocEvent extends ResetEvent {
  final String? uid;
  final List<String>? name;
  final List<int>? age;
  final List<String?> relation;
  String? gender;
  final int? healthLimit;
  final String? phone;
  HealthInsuranceBlocEvent({
    this.uid,
    this.name,
    this.age,
    required this.relation,
    required this.gender,
    this.healthLimit,
    this.phone,
  });
}
