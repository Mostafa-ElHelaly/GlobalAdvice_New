import 'package:get_it/get_it.dart';
import 'package:globaladvice_new/core/service/navigation_service.dart';
import 'package:globaladvice_new/features/home/data/data_source/remotly_data_resource.dart';
import 'package:globaladvice_new/features/home/domain/repo/homeBaseRepo.dart';
import 'package:globaladvice_new/features/home/domain/use_case/healthInsuranceUsecase.dart';
import 'package:globaladvice_new/features/home/presentation/manager/healthinsurancebloc/healthinsurancebloc_bloc.dart';
import '../../features/auth/data/data_source/remotly_data_source.dart';
import '../../features/auth/data/repo_imp/repo_imp.dart';
import '../../features/auth/domain/repo/base_repo.dart';
import '../../features/auth/domain/use_case/login_uc.dart';
import '../../features/auth/domain/use_case/register_uc.dart';
import '../../features/auth/domain/use_case/reset_password_us.dart';
import '../../features/auth/presentation/manager/login_bloc/login_bloc.dart';
import '../../features/auth/presentation/manager/register_bloc/register_bloc.dart';
import '../../features/auth/presentation/manager/reset_password_bloc/bloc/reset_password_bloc.dart';
import '../../features/home/data/repo_imp/repo_impl.dart';
import '../../features/home/domain/use_case/translation_use_case.dart';

final getIt = GetIt.instance;

class ServerLocator {
  Future<void> init() async {
    //bloc
    getIt.registerLazySingleton(() => RegisterBloc(
          registerUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => LoginBloc(
          loginUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => ResetPasswordBloc(
          passwordUseCase: getIt(),
        ));
    getIt.registerLazySingleton(() => HealthinsuranceBloc(
          healthinsuranceblocUsecase: getIt(),
        ));

    //use_case
    getIt.registerLazySingleton(() => RegisterUseCase(baseRepository: getIt()));
    getIt.registerLazySingleton(() => LoginUseCase(baseRepository: getIt()));
    getIt.registerLazySingleton(
        () => ResetPasswordUseCase(baseRepository: getIt()));
    getIt.registerLazySingleton(
        () => HealthInsuranceUsecase(baseRepository: getIt()));

    //Remote Date
    getIt.registerLazySingleton<BaseRemotelyDataSource>(
        () => AuthRemotelyDateSource());
    getIt.registerLazySingleton<BaseHomeRemotelyDataSource>(
        () => HomeRemotelyDataSource());

    //Repository Implementation
    getIt.registerLazySingleton<BaseRepository>(
        () => RepositoryImp(baseRemotelyDataSource: getIt()));
    getIt.registerLazySingleton<BaseHomeRepository>(
        () => HomeRepositoryImp(baseHomeRemotelyDataSource: getIt()));

    // navigation service
    getIt.registerLazySingleton(() => NavigationService());
  }
}
