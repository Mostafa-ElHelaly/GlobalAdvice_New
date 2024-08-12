import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:globaladvice_new/features/home/data/model/car_insurance_request_model.dart';
import 'package:globaladvice_new/features/home/data/model/health_insurance_model.dart';
import 'package:globaladvice_new/features/home/domain/use_case/car_inurance_uc.dart';
import 'package:globaladvice_new/features/home/domain/use_case/healthInsuranceUsecase.dart';
import 'package:globaladvice_new/features/home/presentation/manager/health_insurance_request/healthinsurancebloc_event.dart';
import 'package:globaladvice_new/features/home/presentation/manager/health_insurance_request/healthinsurancebloc_state.dart';

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
      final result = await healthinsuranceblocUsecase.call(CarInusranceRequest(
        uid: event.uid,
        isLicensed: event.isLicensed,
        motorBrands: event.motorBrands,
        motorDeductibles: event.motorDeductibles,
        motorManufactureYear: event.motorManufactureYear,
        phone: event.phone,
        price: event.price,
      ));
      result.fold(
          (l) => emit(CarInsuranceSuccessState(CarInsuranceModel: l)),
          (r) => emit(CarinsuranceRequestErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
