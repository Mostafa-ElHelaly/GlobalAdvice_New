import 'package:dartz/dartz.dart';
import 'package:globaladvice_new/features/home/data/model/car_insurance_request_model.dart';
import 'package:globaladvice_new/features/home/data/model/car_policy_request_model.dart';
import 'package:globaladvice_new/features/home/data/model/health_insurance_model.dart';
import 'package:globaladvice_new/features/home/data/model/property_policy_request_model.dart';
import 'package:globaladvice_new/features/home/domain/repo/homeBaseRepo.dart';

import 'package:globaladvice_new/core/base_use_case/base_use_case.dart';
import 'package:globaladvice_new/core/error/failure.dart';

class PropertyPolicyUsecase extends BaseUseCase<Unit, PropertyPolicyrequest> {
  BaseHomeRepository baseRepository;

  PropertyPolicyUsecase({required this.baseRepository});

  @override
  Future<Either<Unit, Failure>> call(
      PropertyPolicyrequest propertyPolicyModel) async {
    final result =
        await baseRepository.PropertyPolicyRequest(propertyPolicyModel);
    return result;
  }
}
