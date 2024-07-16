import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/healthInsuranceModel.dart';

abstract class BaseHomeRepository {
  Future<Either<Unit, Failure>> sendhealthinsurancerequest(
      HealthInsuranceModel healthInsuranceModel);
}
