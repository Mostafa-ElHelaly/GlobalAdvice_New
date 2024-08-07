import 'package:dartz/dartz.dart';

import 'package:globaladvice_new/core/error/failure.dart';
import 'package:globaladvice_new/features/home/data/model/car_insurance_request_model.dart';
import 'package:globaladvice_new/features/home/data/model/health_insurance_model.dart';
import 'package:globaladvice_new/features/home/data/model/life_insurance_model.dart';
import 'package:globaladvice_new/features/home/data/model/other_forms_model.dart';
import 'package:globaladvice_new/features/home/data/model/property_model.dart';

import '../../data/model/car_dependinces_model.dart';
import '../../data/model/property_dependinces_model.dart';

abstract class BaseHomeRepository {
  Future<Either<Unit, Failure>> SendHealthInsuranceRequest(
      HealthInsuranceModel healthInsuranceModel);

  Future<Either<Unit, Failure>> SendCarInsuranceRequest(
      CarInusranceRequest carInusranceRequest);

  Future<Either<Unit, Failure>> SendPropertyInsuranceRequest(
      PropertyModel propertyModel);

  Future<Either<Unit, Failure>> SendLifeInsuranceRequest(
      LifeInsuranceModel lifeInsuranceModel);

  Future<Either<Unit, Failure>> SendAnotherInsuranceRequest(
      OtherFormsModel otherFormsModel);

  Future<Either<List<CarData>, Failure>> Get_Car_Data();

  Future<Either<List<PropertyDependincesData>, Failure>> Get_Property_Data();
}
