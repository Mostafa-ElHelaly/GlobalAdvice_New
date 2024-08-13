import 'package:bloc/bloc.dart';
import 'package:globaladvice_new/features/home/domain/use_case/health_data_uc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/health_data/health_data_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/health_data/health_data_state.dart';
import '../../../../../core/base_use_case/base_use_case.dart';
import '../../../../../core/utils/api_helper.dart';

class HealthDataBloc extends Bloc<HealthDataEvent, HealthDataState> {
  FetchingHealthDataUsecase HealthdataUseCase;

  HealthDataBloc({required this.HealthdataUseCase})
      : super(HealthDataInitial()) {
    on<HealthDataEvent>((event, emit) async {
      emit(const HealthDataLoadingState());
      final result = await HealthdataUseCase.call(const Noparamiter());
      result.fold(
          (l) => emit(HealthDataSuccessState(l)),
          (r) => emit(HealthDataErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
