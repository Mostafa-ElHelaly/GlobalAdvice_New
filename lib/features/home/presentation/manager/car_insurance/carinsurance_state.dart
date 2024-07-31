import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

sealed class CarinsuranceblocState extends Equatable {
  const CarinsuranceblocState();

  @override
  List<Object> get props => [];
}

final class CarinsuranceblocInitial extends CarinsuranceblocState {}

final class CarinsuranceRequestLoadingState extends CarinsuranceblocState {
  const CarinsuranceRequestLoadingState();
}

final class CarinsuranceRequestErrorState extends CarinsuranceblocState {
  final String errorMessage;

  const CarinsuranceRequestErrorState({required this.errorMessage});
}

final class CarInsuranceSuccessState extends CarinsuranceblocState {
  final Unit CarInsuranceModel;

  const CarInsuranceSuccessState({required this.CarInsuranceModel});
}
