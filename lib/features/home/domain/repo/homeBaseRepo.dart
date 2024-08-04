import 'package:dartz/dartz.dart';

import 'package:globaladvice_new/core/error/failure.dart';
import 'package:globaladvice_new/features/home/data/model/healthInsuranceModel.dart';
import 'package:globaladvice_new/features/home/data/model/lifeInsurance.dart';
import 'package:globaladvice_new/features/home/data/model/other_forms_model.dart';

abstract class BaseHomeRepository {
  Future<Either<Unit, Failure>> sendhealthinsurancerequest(
      HealthInsuranceModel healthInsuranceModel);
  Future<Either<Unit, Failure>> sendcarinsurancerequest(
      HealthInsuranceModel healthInsuranceModel);
  Future<Either<Unit, Failure>> sendpropertyinsurancerequest(
      HealthInsuranceModel healthInsuranceModel);
  Future<Either<Unit, Failure>> SendLifeInsuranceRequest(
      LifeInsuranceModel lifeInsuranceModel);
  Future<Either<Unit, Failure>> sendanotherinsurancerequest(
      OtherFormsModel otherFormsModel);
}
