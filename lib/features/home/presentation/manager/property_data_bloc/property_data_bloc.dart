import 'package:bloc/bloc.dart';
import 'package:globaladvice_new/features/home/domain/use_case/property_data_uc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_data_bloc/property_data_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_data_bloc/property_data_state.dart';
import '../../../../../core/base_use_case/base_use_case.dart';
import '../../../../../core/utils/api_helper.dart';

class PropertyDataBloc extends Bloc<PropertyDataEvent, PropertyDataState> {
  PropertyDataUsecase propertyDataUsecase;

  PropertyDataBloc({required this.propertyDataUsecase})
      : super(PropertyDataInitial()) {
    on<PropertyDataEvent>((event, emit) async {
      emit(const PropertyDataLoadingState());
      final result = await propertyDataUsecase.call(const Noparamiter());
      result.fold(
        (l) => emit(PropertyDataSuccessState(l)),
          (r) => emit(PropertyDataErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
