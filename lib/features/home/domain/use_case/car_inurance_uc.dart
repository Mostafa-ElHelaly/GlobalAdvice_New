import 'package:dartz/dartz.dart';
import 'package:globaladvice_new/features/home/data/model/car_insurance_request_model.dart';
import 'package:globaladvice_new/features/home/data/model/health_insurance_model.dart';
import 'package:globaladvice_new/features/home/domain/repo/homeBaseRepo.dart';

import 'package:globaladvice_new/core/base_use_case/base_use_case.dart';
import 'package:globaladvice_new/core/error/failure.dart';

class CarInsuranceUsecase
    extends BaseUseCase<Map<String, dynamic>, CarInusranceRequest> {
  BaseHomeRepository baseRepository;

  CarInsuranceUsecase({required this.baseRepository});

  @override
  Future<Either<Map<String, dynamic>, Failure>> call(
      CarInusranceRequest CarInsuranceModel) async {
    final result =
        await baseRepository.SendCarInsuranceRequest(CarInsuranceModel);
    return result;
  }
}
