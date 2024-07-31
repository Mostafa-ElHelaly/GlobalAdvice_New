import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:globaladvice_new/features/home/data/model/healthInsuranceModel.dart';
import 'package:globaladvice_new/features/home/domain/use_case/car_inurance_uc.dart';
import 'package:globaladvice_new/features/home/domain/use_case/healthInsuranceUsecase.dart';
import 'package:globaladvice_new/features/home/presentation/manager/healthinsurancebloc/healthinsurancebloc_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/healthinsurancebloc/healthinsurancebloc_state.dart';

import '../../../../../core/utils/api_helper.dart';
import 'carinsurance_event.dart';
import 'carinsurance_state.dart';

class CarinsuranceBloc
    extends Bloc<CarinsuranceblocEvent, CarinsuranceblocState> {
  CarInsuranceUsecase healthinsuranceblocUsecase;
  CarinsuranceBloc({required this.healthinsuranceblocUsecase})
      : super(CarinsuranceblocInitial()) {
    on<CarinsuranceblocEvent>((event, emit) async {
      emit(const CarinsuranceRequestLoadingState());
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
          (l) => emit(CarInsuranceSuccessState(CarInsuranceModel: l)),
          (r) => emit(CarinsuranceRequestErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
