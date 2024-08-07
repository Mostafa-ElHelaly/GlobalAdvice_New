import 'package:get_it/get_it.dart';
import 'package:globaladvice_new/core/service/navigation_service.dart';
import 'package:globaladvice_new/features/home/data/data_source/remotly_data_resource.dart';
import 'package:globaladvice_new/features/home/domain/repo/homeBaseRepo.dart';
import 'package:globaladvice_new/features/home/domain/use_case/car_inurance_uc.dart';
import 'package:globaladvice_new/features/home/domain/use_case/healthInsuranceUsecase.dart';
import 'package:globaladvice_new/features/home/domain/use_case/property_data_uc.dart';
import 'package:globaladvice_new/features/home/domain/use_case/property_inusrance_uc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/car_insurance/carinsurance_bloc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/healthinsurancebloc/healthinsurancebloc_bloc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/life_insurance/life_insurance_bloc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_data_bloc/property_data_bloc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_insurance.dart/property_insurance_bloc.dart';
import 'package:globaladvice_new/features/auth/data/data_source/remotly_data_source.dart';
import 'package:globaladvice_new/features/auth/data/repo_imp/repo_imp.dart';
import 'package:globaladvice_new/features/auth/domain/repo/base_repo.dart';
import 'package:globaladvice_new/features/auth/domain/use_case/login_uc.dart';
import 'package:globaladvice_new/features/auth/domain/use_case/register_uc.dart';
import 'package:globaladvice_new/features/auth/domain/use_case/reset_password_us.dart';
import 'package:globaladvice_new/features/auth/presentation/manager/login_bloc/login_bloc.dart';
import 'package:globaladvice_new/features/auth/presentation/manager/register_bloc/register_bloc.dart';
import 'package:globaladvice_new/features/auth/presentation/manager/reset_password_bloc/bloc/reset_password_bloc.dart';
import 'package:globaladvice_new/features/home/data/repo_imp/repo_impl.dart';
import 'package:globaladvice_new/features/home/domain/use_case/life_insurance_uc.dart';
import 'package:globaladvice_new/features/home/domain/use_case/other_insurance_uc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/other_forms_bloc/other_forms_bloc.dart';

import '../../features/home/domain/use_case/car_data_uc.dart';
import '../../features/home/presentation/manager/car_data_bloc/car_data_bloc.dart';

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
    getIt.registerLazySingleton(
        () => CarinsuranceBloc(healthinsuranceblocUsecase: getIt()));
    getIt.registerLazySingleton(
        () => LifeInsuranceBloc(lifeInsuranceUseCase: getIt()));

    getIt.registerLazySingleton(() => PropertyInsuranceBloc(
          propertyInsuranceUseCase: getIt(),
        ));

    getIt.registerLazySingleton(() => CarDataBloc(CarInuranceUseCase: getIt()));
    getIt.registerLazySingleton(
        () => PropertyDataBloc(propertyDataUseCase: getIt()));

    getIt.registerLazySingleton(
        () => OtherInsuranceBloc(healthinsuranceblocUsecase: getIt()));

    //use_case
    getIt.registerLazySingleton(() => RegisterUseCase(baseRepository: getIt()));
    getIt.registerLazySingleton(() => LoginUseCase(baseRepository: getIt()));
    getIt.registerLazySingleton(
        () => ResetPasswordUseCase(baseRepository: getIt()));
    getIt.registerLazySingleton(
        () => HealthInsuranceUsecase(baseRepository: getIt()));
    getIt.registerLazySingleton(
        () => CarInsuranceUsecase(baseRepository: getIt()));
    getIt.registerLazySingleton(
        () => LifeInsuranceUseCase(baseRepository: getIt()));
    getIt.registerLazySingleton(
        () => PropertyInsuranceUseCase(baseRepository: getIt()));
    getIt.registerLazySingleton(
        () => OtherInsuranceUsecase(baseRepository: getIt()));
    getIt.registerLazySingleton(() => CarDataUsecase(baseRepository: getIt()));
    getIt.registerLazySingleton(
        () => PropertyDataUsecase(baseRepository: getIt()));

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
