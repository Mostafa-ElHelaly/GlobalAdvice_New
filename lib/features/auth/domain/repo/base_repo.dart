import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/login_model.dart';
import '../use_case/login_uc.dart';
import '../use_case/register_uc.dart';

abstract class BaseRepository {
  Future<Either<Unit, Failure>> loginWithEmailAndPassword(LoginModel authModel);
  Future<Either<Unit, Failure>> registerWithEmailAndPassword(
      LoginModel registerAuthModel);
  Future<Either<Unit, Failure>> resetPassword(String email);
}
