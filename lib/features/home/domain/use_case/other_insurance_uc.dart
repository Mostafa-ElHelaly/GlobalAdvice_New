import 'package:dartz/dartz.dart';
import 'package:globaladvice_new/features/home/domain/repo/homeBaseRepo.dart';

import 'package:globaladvice_new/core/base_use_case/base_use_case.dart';
import 'package:globaladvice_new/core/error/failure.dart';
import 'package:globaladvice_new/features/home/data/model/other_forms_model.dart';

class OtherInsuranceUsecase extends BaseUseCase<Unit, OtherFormsModel> {
  BaseHomeRepository baseRepository;

  OtherInsuranceUsecase({required this.baseRepository});

  @override
  Future<Either<Unit, Failure>> call(OtherFormsModel otherFormsModel) async {
    final result =
        await baseRepository.SendAnotherInsuranceRequest(otherFormsModel);
    return result;
  }
}
