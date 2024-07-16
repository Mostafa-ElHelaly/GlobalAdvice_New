import 'package:dartz/dartz.dart';
import 'package:globaladvice_new/features/home/data/model/healthInsuranceModel.dart';
import 'package:globaladvice_new/features/home/domain/repo/homeBaseRepo.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/error/failure.dart';

class HealthInsuranceUsecase extends BaseUseCase<Unit, HealthInsuranceModel> {
  BaseHomeRepository baseRepository;

  HealthInsuranceUsecase({required this.baseRepository});

  @override
  Future<Either<Unit, Failure>> call(
      HealthInsuranceModel healthInsuranceModel) async {
    final result =
        await baseRepository.sendhealthinsurancerequest(healthInsuranceModel);
    return result;
  }
}
