import 'package:dartz/dartz.dart';

import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/register_model.dart';
import '../repo/base_repo.dart';


class RegisterUseCase extends BaseUseCase<RegisterModel, RegisterAuthModel> {
  BaseRepository baseRepository;

  RegisterUseCase({required this.baseRepository});

  @override
  Future<Either<RegisterModel, Failure>> call(RegisterAuthModel parameter) async {
    final result = await baseRepository.RegisterWithEmailAndPassword(parameter);

    return result;
  }
}

class RegisterAuthModel {
  final String email;
  final String password;

  RegisterAuthModel({required this.email, required this.password});
}
