import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:globaladvice_new/features/auth/data/model/login_model.dart';
import 'package:globaladvice_new/features/auth/data/model/reset_password_model.dart';

sealed class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

final class ResetPasswordInitial extends ResetPasswordState {}

final class Loadingchangingpasswordstate extends ResetPasswordState {
  const Loadingchangingpasswordstate();
}

final class Resetpasswordsuccess extends ResetPasswordState {
  final Unit resetPasswordModel;

  const Resetpasswordsuccess({required this.resetPasswordModel});
}

class Changingfailedstate extends ResetPasswordState {
  final String errorMessage;

  Changingfailedstate({required this.errorMessage});
}
