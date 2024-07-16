import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:globaladvice_new/features/home/data/model/healthInsuranceModel.dart';
import 'package:globaladvice_new/features/home/domain/use_case/healthInsuranceUsecase.dart';
import 'package:globaladvice_new/features/home/presentation/manager/healthinsurancebloc/healthinsurancebloc_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/healthinsurancebloc/healthinsurancebloc_state.dart';

import '../../../../../core/utils/api_helper.dart';

class HealthinsuranceBloc
    extends Bloc<HealthinsuranceblocEvent, HealthinsuranceblocState> {
  HealthInsuranceUsecase healthinsuranceblocUsecase;
  HealthinsuranceBloc({required this.healthinsuranceblocUsecase})
      : super(HealthinsuranceblocInitial()) {
    on<HealthinsuranceblocEvent>((event, emit) async {
      emit(const HealthinsuranceRequestLoadingState());
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
          (l) => emit(HealthInsuranceSuccessState(healthInsuranceModel: l)),
          (r) => emit(HealthinsuranceRequestErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
