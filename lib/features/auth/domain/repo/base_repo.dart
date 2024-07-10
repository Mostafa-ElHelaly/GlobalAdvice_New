import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/login_model.dart';
import '../../data/model/reset_password_model.dart';

abstract class BaseRepository {
  Future<Either<LoginModel, Failure>> loginWithEmailAndPassword(
      LoginModel authModel);
  Future<Either<LoginModel, Failure>> registerWithEmailAndPassword(
      LoginModel registerAuthModel);
  Future<Either<Unit, Failure>> resetPassword(String email);
}
