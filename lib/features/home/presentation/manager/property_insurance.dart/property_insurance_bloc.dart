import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:globaladvice_new/features/home/data/model/healthInsuranceModel.dart';
import 'package:globaladvice_new/features/home/domain/use_case/car_inurance_uc.dart';
import 'package:globaladvice_new/features/home/domain/use_case/healthInsuranceUsecase.dart';
import 'package:globaladvice_new/features/home/domain/use_case/life_insurance_uc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/healthinsurancebloc/healthinsurancebloc_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/healthinsurancebloc/healthinsurancebloc_state.dart';
import 'package:globaladvice_new/features/home/presentation/manager/life_insurance/life_insurance_state.dart';
import 'package:globaladvice_new/features/home/presentation/manager/property_insurance.dart/property_insurance_event.dart';

import '../../../../../core/utils/api_helper.dart';
import '../../../domain/use_case/property_inusrance_uc.dart';
import 'property_insurance_state.dart';

class PropertyInsuranceBloc
    extends Bloc<PropertyinsuranceblocEvent, PropertyinsuranceblocState> {
  PropertyInsuranceUsecase healthinsuranceblocUsecase;
  PropertyInsuranceBloc({required this.healthinsuranceblocUsecase})
      : super(PropertyinsuranceblocInitial()) {
    on<PropertyinsuranceblocEvent>((event, emit) async {
      emit(const PropertyinsuranceRequestLoadingState());
      final result = await healthinsuranceblocUsecase.call(HealthInsuranceModel(
        uid: event.uid,
        organizationId: event.organizationId,
        planId: event.planId,
        name: event.name,
        age: event.age,
        relation: event.relation,
        price: event.price,
        gende: event.gender,
      ));
      result.fold(
          (l) => emit(PropertyInsuranceSuccessState(PropertyInsuranceModel: l)),
          (r) => emit(PropertyinsuranceRequestErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
