import 'package:bloc/bloc.dart';
import 'package:globaladvice_new/features/home/domain/use_case/car_data_uc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/car_data_bloc/car_data_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/car_data_bloc/car_data_state.dart';
import 'package:globaladvice_new/core/base_use_case/base_use_case.dart';
import 'package:globaladvice_new/core/utils/api_helper.dart';

class CarDataBloc extends Bloc<CarDataEvent, CarDataState> {
  CarDataUseCase CarInuranceUseCase;

  CarDataBloc({required this.CarInuranceUseCase}) : super(CarDataInitial()) {
    on<CarDataEvent>((event, emit) async {
      emit(const CarDataLoadingState());
      final result = await CarInuranceUseCase.call(const Noparamiter());
      result.fold(
          (l) => emit(CarDataSuccessState(l)),
          (r) => emit(CarDataErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
