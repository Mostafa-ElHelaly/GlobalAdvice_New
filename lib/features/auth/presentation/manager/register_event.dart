abstract class BaseSignupEvent {}

class RegisterEvent extends BaseSignupEvent {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterEvent({required this.email, required this.password, required this.firstName, required this.lastName, required this.phone,required this.confirmPassword,});
}
