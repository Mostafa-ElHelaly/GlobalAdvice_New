import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/api_helper.dart';
import '../../domain/repo/base_repo.dart';
import '../../domain/use_case/login_uc.dart';
import '../../domain/use_case/register_uc.dart';
import '../../domain/use_case/reset_password_us.dart';
import '../data_source/remotly_data_source.dart';
import '../model/login_model.dart';
import '../model/reset_password_model.dart';

class RepositoryImp extends BaseRepository {
  final BaseRemotelyDataSource baseRemotelyDataSource;

  RepositoryImp({required this.baseRemotelyDataSource});

  @override
  Future<Either<Unit, Failure>> loginWithEmailAndPassword(
      LoginModel authModel) async {
    try {
      final result =
          await baseRemotelyDataSource.loginWithEmailAndPassword(authModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<Unit, Failure>> registerWithEmailAndPassword(
      LoginModel registerAuthModel) async {
    try {
      final result = await baseRemotelyDataSource
          .registerWithEmailAndPassword(registerAuthModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<Unit, Failure>> resetPassword(String email) async {
    try {
      final result = await baseRemotelyDataSource.resetPasswordWithEmail(email);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}
