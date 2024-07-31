import 'package:dartz/dartz.dart';
import 'package:globaladvice_new/features/home/data/model/healthInsuranceModel.dart';
import 'package:globaladvice_new/features/home/domain/repo/homeBaseRepo.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/error/failure.dart';

class PropertyInsuranceUsecase extends BaseUseCase<Unit, HealthInsuranceModel> {
  BaseHomeRepository baseRepository;

  PropertyInsuranceUsecase({required this.baseRepository});

  @override
  Future<Either<Unit, Failure>> call(
      HealthInsuranceModel healthInsuranceModel) async {
    final result =
        await baseRepository.sendpropertyinsurancerequest(healthInsuranceModel);
    return result;
  }
}
