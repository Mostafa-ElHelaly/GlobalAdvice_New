import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

sealed class PropertyinsuranceblocState extends Equatable {
  const PropertyinsuranceblocState();

  @override
  List<Object> get props => [];
}

final class PropertyinsuranceblocInitial extends PropertyinsuranceblocState {}

final class PropertyinsuranceRequestLoadingState
    extends PropertyinsuranceblocState {
  const PropertyinsuranceRequestLoadingState();
}

final class PropertyinsuranceRequestErrorState
    extends PropertyinsuranceblocState {
  final String errorMessage;

  const PropertyinsuranceRequestErrorState({required this.errorMessage});
}

final class PropertyInsuranceSuccessState extends PropertyinsuranceblocState {
  final Unit PropertyInsuranceModel;

  const PropertyInsuranceSuccessState({required this.PropertyInsuranceModel});
}
