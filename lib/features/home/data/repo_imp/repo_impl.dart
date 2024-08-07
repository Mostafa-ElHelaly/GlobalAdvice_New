import 'package:dartz/dartz.dart';
import 'package:globaladvice_new/features/home/data/data_source/remotly_data_resource.dart';
import 'package:globaladvice_new/features/home/data/model/car_dependinces_model.dart';
import 'package:globaladvice_new/features/home/data/model/car_insurance_request_model.dart';
import 'package:globaladvice_new/features/home/data/model/health_insurance_model.dart';
import 'package:globaladvice_new/features/home/data/model/other_forms_model.dart';
import 'package:globaladvice_new/features/home/data/model/property_dependinces_model.dart';
import 'package:globaladvice_new/features/home/data/model/property_model.dart';
import 'package:globaladvice_new/features/home/domain/repo/homeBaseRepo.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/api_helper.dart';
import '../model/life_insurance_model.dart';

class HomeRepositoryImp extends BaseHomeRepository {
  final BaseHomeRemotelyDataSource baseHomeRemotelyDataSource;

  HomeRepositoryImp({required this.baseHomeRemotelyDataSource});

  @override
  Future<Either<Unit, Failure>> SendHealthInsuranceRequest(
      HealthInsuranceModel healthInsuranceModel) async {
    try {
      final result =
          await baseHomeRemotelyDataSource.SendHealthInsuranceRequest(
              healthInsuranceModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<Unit, Failure>> SendCarInsuranceRequest(
      CarInusranceRequest carInusranceRequest) async {
    try {
      final result = await baseHomeRemotelyDataSource.SendCarInsuranceRequest(
          carInusranceRequest);
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
  Future<Either<Unit, Failure>> SendPropertyInsuranceRequest(
      PropertyModel propertyModel) async {
    try {
      final result =
          await baseHomeRemotelyDataSource.SendPropertyInsuranceRequest(
              propertyModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<Unit, Failure>> SendAnotherInsuranceRequest(
      OtherFormsModel otherFormsModel) async {
    try {
      final result =
          await baseHomeRemotelyDataSource.SendAnotherInsuranceRequest(
              otherFormsModel);
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<List<CarData>, Failure>> Get_Car_Data() async {
    try {
      final result = await baseHomeRemotelyDataSource.Get_Car_Data();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }

  @override
  Future<Either<List<PropertyDependincesData>, Failure>>
      Get_Property_Data() async {
    try {
      final result = await baseHomeRemotelyDataSource.Get_Property_Data();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}
