import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:globaladvice_new/features/home/data/model/car_insurance_request_model.dart';
import 'package:globaladvice_new/features/home/data/model/car_policy_request_model.dart';
import 'package:globaladvice_new/features/home/data/model/health_insurance_model.dart';
import 'package:globaladvice_new/features/home/domain/use_case/car_inurance_uc.dart';
import 'package:globaladvice_new/features/home/domain/use_case/car_policy_uc.dart';
import 'package:globaladvice_new/features/home/domain/use_case/healthInsuranceUsecase.dart';
import 'package:globaladvice_new/features/home/presentation/manager/car_policy/car_policy_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/car_policy/car_policy_state.dart';
import 'package:globaladvice_new/features/home/presentation/manager/health_insurance_request/healthinsurancebloc_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/health_insurance_request/healthinsurancebloc_state.dart';

import '../../../../../core/utils/api_helper.dart';

class CarPolicyBloc extends Bloc<CarPolicyblocEvent, CarPolicyblocState> {
  CarPolicyUsecase carpolicyblocUsecase;
  CarPolicyBloc({required this.carpolicyblocUsecase})
      : super(CarPolicyblocInitial()) {
    on<CarPolicyblocEvent>((event, emit) async {
      emit(const CarPolicyRequestLoadingState());
      final result = await carpolicyblocUsecase.call(CarPolicyrequest(
        isLicensed: event.isLicensed,
        motorBrands: event.motorBrands,
        motorDeductibles: event.motorDeductibles,
        motorManufactureYear: event.motorManufactureYear,
        organizationId: event.organizationId,
        planId: event.planId,
        price: event.price,
        uID: event.uID,
      ));
      result.fold(
          (l) => emit(CarPolicySuccessState(CarPolicyModel: l)),
          (r) => emit(CarPolicyRequestErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
