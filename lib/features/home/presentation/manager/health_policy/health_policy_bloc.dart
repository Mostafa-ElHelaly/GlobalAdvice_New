import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:globaladvice_new/features/home/data/model/car_insurance_request_model.dart';
import 'package:globaladvice_new/features/home/data/model/car_policy_request_model.dart';
import 'package:globaladvice_new/features/home/data/model/health_insurance_model.dart';
import 'package:globaladvice_new/features/home/domain/use_case/car_inurance_uc.dart';
import 'package:globaladvice_new/features/home/domain/use_case/car_policy_uc.dart';
import 'package:globaladvice_new/features/home/domain/use_case/healthInsuranceUsecase.dart';
import 'package:globaladvice_new/features/home/domain/use_case/health_policy_uc.dart';
import 'package:globaladvice_new/features/home/presentation/manager/car_policy/car_policy_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/car_policy/car_policy_state.dart';
import 'package:globaladvice_new/features/home/presentation/manager/health_insurance_request/healthinsurancebloc_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/health_insurance_request/healthinsurancebloc_state.dart';
import 'package:globaladvice_new/features/home/presentation/manager/health_policy/health_policy_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/health_policy/health_policy_state.dart';

import '../../../../../core/utils/api_helper.dart';
import '../../../data/model/health_policy_request_model.dart';

class HealthPolicyBloc
    extends Bloc<HealthPolicyblocEvent, HealthPolicyblocState> {
  HealthPolicyUsecase healthpolicyblocUsecase;
  HealthPolicyBloc({required this.healthpolicyblocUsecase})
      : super(HealthPolicyblocInitial()) {
    on<HealthPolicyblocEvent>((event, emit) async {
      emit(const HealthPolicyRequestLoadingState());
      final result = await healthpolicyblocUsecase.call(HealthPolicyrequest(
        uID: event.uID,
        organizationId: event.organizationId,
        planId: event.planId,
        price: event.price,
        relations: event.relations,
        age: event.age,
        name: event.name,
        gender: event.gender,
      ));
      result.fold(
          (l) => emit(HealthPolicySuccessState(HealthPolicyModel: l)),
          (r) => emit(HealthPolicyRequestErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
