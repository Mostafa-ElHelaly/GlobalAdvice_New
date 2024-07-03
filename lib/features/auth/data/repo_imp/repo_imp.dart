import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/api_helper.dart';
import '../../domain/repo/base_repo.dart';
import '../../domain/use_case/login_uc.dart';
import '../../domain/use_case/register_uc.dart';
import '../data_source/remotly_data_source.dart';
import '../model/login_model.dart';



class RepositoryImp extends BaseRepository {
  final BaseRemotelyDataSource baseRemotelyDataSource;

  RepositoryImp({required this.baseRemotelyDataSource});


  @override
  Future<Either<LoginModel, Failure>> loginWithEmailAndPassword(AuthModel authModel) async {
    try {
      final result = await baseRemotelyDataSource.loginWithEmailAndPassword(authModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }





  @override
  Future<Either<LoginModel, Failure>> RegisterWithEmailAndPassword(RegisterAuthModel registerAuthModel) async {
    try {
      final result = await baseRemotelyDataSource.registerWithEmailAndPassword(registerAuthModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }





}