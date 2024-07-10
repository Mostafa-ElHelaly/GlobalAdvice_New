import 'package:dartz/dartz.dart';
import 'package:globaladvice_new/features/auth/data/model/login_model.dart';
import '../../../../core/base_use_case/base_use_case.dart';
import '../../../../core/error/failure.dart';
import '../../data/model/reset_password_model.dart';
import '../repo/base_repo.dart';

class ResetPasswordUseCase extends BaseUseCase<LoginModel, LoginModel> {
  BaseRepository baseRepository;

  ResetPasswordUseCase({required this.baseRepository});

  @override
  Future<Either<LoginModel, Failure>> call(LoginModel parameter) async {
    final result = await baseRepository.resetPassword(parameter);

    return result;
  }
}
