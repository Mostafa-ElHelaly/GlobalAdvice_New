abstract class ResetEvent {}

class CarinsuranceblocEvent extends ResetEvent {
  final String uid;
  final String organizationId;
  final String planId;
  final String name;
  final String age;
  final String relation;
  final String price;
  final String gender;
  CarinsuranceblocEvent({
    required this.uid,
    required this.organizationId,
    required this.planId,
    required this.name,
    required this.age,
    required this.relation,
    required this.price,
    required this.gender,
  });
}
