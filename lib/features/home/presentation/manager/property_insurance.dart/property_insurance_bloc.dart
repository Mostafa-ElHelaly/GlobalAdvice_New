import 'package:bloc/bloc.dart';
import 'package:globaladvice_new/features/home/data/model/property_model.dart';
import 'package:globaladvice_new/features/home/domain/use_case/property_inusrance_uc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_insurance.dart/property_insurance_event.dart';

import 'package:globaladvice_new/core/utils/api_helper.dart';
import 'package:globaladvice_new/features/home/domain/use_case/property_inusrance_uc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_insurance.dart/property_insurance_state.dart';

class PropertyInsuranceBloc
    extends Bloc<PropertyInsuranceBlocEvent, PropertyInsuranceBlocState> {
  PropertyInsuranceUseCase propertyInsuranceUseCase;

  PropertyInsuranceBloc({required this.propertyInsuranceUseCase})
      : super(PropertyInsuranceBlocInitial()) {
    on<PropertyInsuranceBlocEvent>((event, emit) async {
      emit(const PropertyInsuranceBlocRequestLoadingState());
      final result = await propertyInsuranceUseCase.call(PropertyModel(
        uid: event.uid,
        name: event.name,
        buildingPrice: event.buildingPrice,
        contentPrice: event.contentPrice,
        type: event.type,
        homeBenefits: event.homeBenefits,
        phone: event.phone,
      ));
      result.fold(
          (l) => emit(PropertyInsuranceSuccessState(PropertyModel: l)),
          (r) => emit(PropertyInsuranceRequestErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
