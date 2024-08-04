import 'package:dartz/dartz.dart';
import 'package:globaladvice_new/features/home/domain/repo/homeBaseRepo.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/other_forms_model.dart';

class OtherInsuranceUsecase extends BaseUseCase<Unit, OtherFormsModel> {
  BaseHomeRepository baseRepository;

  OtherInsuranceUsecase({required this.baseRepository});

  @override
  Future<Either<Unit, Failure>> call(OtherFormsModel otherFormsModel) async {
    final result =
        await baseRepository.sendanotherinsurancerequest(otherFormsModel);
    return result;
  }
}
