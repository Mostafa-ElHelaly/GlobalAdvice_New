import 'package:dartz/dartz.dart';
import 'package:globaladvice_new/features/home/data/model/car_dependinces_model.dart';
import 'package:globaladvice_new/features/home/domain/repo/homeBaseRepo.dart';

import 'package:globaladvice_new/core/base_use_case/base_use_case.dart';
import 'package:globaladvice_new/core/error/failure.dart';

class CarDataUsecase extends BaseUseCase<List<CarData>, Noparamiter> {
  BaseHomeRepository baseRepository;

  CarDataUsecase({required this.baseRepository});

  @override
  Future<Either<List<CarData>, Failure>> call(Noparamiter parameter) async {
    final result = await baseRepository.Get_Car_Data();
    return result;
  }
}
