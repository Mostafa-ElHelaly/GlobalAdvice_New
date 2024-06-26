import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/login_model.dart';
import '../../data/model/register_model.dart';
import '../use_case/login_uc.dart';
import '../use_case/register_uc.dart';

abstract class BaseRepository {
  Future<Either<LoginModel, Failure>> loginWithEmailAndPassword(AuthModel authModel);
  Future<Either<RegisterModel, Failure>> RegisterWithEmailAndPassword(RegisterAuthModel registerAuthModel);
}
