import 'package:dartz/dartz.dart';
import 'package:globaladvice_new/features/home/data/data_source/remotly_data_resource.dart';
import 'package:globaladvice_new/features/home/data/model/healthInsuranceModel.dart';
import 'package:globaladvice_new/features/home/data/model/other_forms_model.dart';
import 'package:globaladvice_new/features/home/domain/repo/homeBaseRepo.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/api_helper.dart';
import '../model/lifeInsurance.dart';

class HomeRepositoryImp extends BaseHomeRepository {
  final BaseHomeRemotelyDataSource baseHomeRemotelyDataSource;

  HomeRepositoryImp({required this.baseHomeRemotelyDataSource});

  @override
  Future<Either<Unit, Failure>> sendhealthinsurancerequest(
      HealthInsuranceModel healthInsuranceModel) async {
    try {
      final result = await baseHomeRemotelyDataSource
          .sendhealthinsurancerequest(healthInsuranceModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<Unit, Failure>> sendcarinsurancerequest(
      HealthInsuranceModel healthInsuranceModel) async {
    try {
      final result = await baseHomeRemotelyDataSource
          .sendcarinsurancerequest(healthInsuranceModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<Unit, Failure>> SendLifeInsuranceRequest(
      LifeInsuranceModel lifeInsuranceModel) async {
    try {
      final result = await baseHomeRemotelyDataSource.SendLifeInsuranceRequest(
          lifeInsuranceModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<Unit, Failure>> sendpropertyinsurancerequest(
      HealthInsuranceModel healthInsuranceModel) async {
    try {
      final result = await baseHomeRemotelyDataSource.SendLifeInsuranceRequest(
          LifeInsuranceModel as LifeInsuranceModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<Unit, Failure>> sendanotherinsurancerequest(
      OtherFormsModel otherFormsModel) async {
    try {
      final result =
          await baseHomeRemotelyDataSource.sendanotherinsurancerequest(
              otherFormsModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}
