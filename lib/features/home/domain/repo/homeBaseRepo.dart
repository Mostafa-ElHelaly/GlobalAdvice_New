import 'package:dartz/dartz.dart';
import 'package:globaladvice_new/features/home/data/model/other_forms_model.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/healthInsuranceModel.dart';

abstract class BaseHomeRepository {
  Future<Either<Unit, Failure>> sendhealthinsurancerequest(
      HealthInsuranceModel healthInsuranceModel);
  Future<Either<Unit, Failure>> sendcarinsurancerequest(
      HealthInsuranceModel healthInsuranceModel);
  Future<Either<Unit, Failure>> sendpropertyinsurancerequest(
      HealthInsuranceModel healthInsuranceModel);
  Future<Either<Unit, Failure>> sendlifeinsurancerequest(
      HealthInsuranceModel healthInsuranceModel);
  Future<Either<Unit, Failure>> sendanotherinsurancerequest(
      OtherFormsModel otherFormsModel);
}
