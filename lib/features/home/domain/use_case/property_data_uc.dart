import 'package:dartz/dartz.dart';
import 'package:globaladvice_new/features/home/data/model/property_dependinces_model.dart';
import 'package:globaladvice_new/features/home/domain/repo/homeBaseRepo.dart';

import 'package:globaladvice_new/core/base_use_case/base_use_case.dart';
import 'package:globaladvice_new/core/error/failure.dart';

class PropertyDataUsecase
    extends BaseUseCase<List<PropertyDependincesData>, Noparamiter> {
  BaseHomeRepository baseRepository;

  PropertyDataUsecase({required this.baseRepository});

  @override
  Future<Either<List<PropertyDependincesData>, Failure>> call(
      Noparamiter parameter) async {
    final result = await baseRepository.Get_Property_Data();
    return result;
  }
}
