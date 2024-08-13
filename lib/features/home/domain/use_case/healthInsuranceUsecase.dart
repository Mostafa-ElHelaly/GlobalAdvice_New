import 'package:dartz/dartz.dart';
import 'package:globaladvice_new/features/home/data/model/health_insurance_model.dart';
import 'package:globaladvice_new/features/home/domain/repo/homeBaseRepo.dart';

import 'package:globaladvice_new/core/base_use_case/base_use_case.dart';
import 'package:globaladvice_new/core/error/failure.dart';

class HealthInsuranceUsecase
    extends BaseUseCase<Map<String, dynamic>, HealthInsuranceModel> {
  BaseHomeRepository baseRepository;

  HealthInsuranceUsecase({required this.baseRepository});

  @override
  Future<Either<Map<String, dynamic>, Failure>> call(
      HealthInsuranceModel healthInsuranceModel) async {
    final result =
        await baseRepository.SendHealthInsuranceRequest(healthInsuranceModel);
    return result;
  }
}
