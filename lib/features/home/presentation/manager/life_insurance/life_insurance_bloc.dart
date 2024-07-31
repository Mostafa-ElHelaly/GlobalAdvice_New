import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:globaladvice_new/features/home/data/model/healthInsuranceModel.dart';
import 'package:globaladvice_new/features/home/domain/use_case/car_inurance_uc.dart';
import 'package:globaladvice_new/features/home/domain/use_case/healthInsuranceUsecase.dart';
import 'package:globaladvice_new/features/home/domain/use_case/life_insurance_uc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/healthinsurancebloc/healthinsurancebloc_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/healthinsurancebloc/healthinsurancebloc_state.dart';
import 'package:globaladvice_new/features/home/presentation/manager/life_insurance/life_insurance_state.dart';

import '../../../../../core/utils/api_helper.dart';
import 'life_insurance_event.dart';

class LifeInsuranceBloc
    extends Bloc<LifeinsuranceblocEvent, LifeinsuranceblocState> {
  LifeInsuranceUsecase healthinsuranceblocUsecase;
  LifeInsuranceBloc({required this.healthinsuranceblocUsecase})
      : super(LifeinsuranceblocInitial()) {
    on<LifeinsuranceblocEvent>((event, emit) async {
      emit(const LifeinsuranceRequestLoadingState());
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
          (l) => emit(LifeInsuranceSuccessState(LifeInsuranceModel: l)),
          (r) => emit(LifeinsuranceRequestErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
