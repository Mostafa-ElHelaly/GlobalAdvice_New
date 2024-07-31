import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

sealed class LifeinsuranceblocState extends Equatable {
  const LifeinsuranceblocState();

  @override
  List<Object> get props => [];
}

final class LifeinsuranceblocInitial extends LifeinsuranceblocState {}

final class LifeinsuranceRequestLoadingState extends LifeinsuranceblocState {
  const LifeinsuranceRequestLoadingState();
}

final class LifeinsuranceRequestErrorState extends LifeinsuranceblocState {
  final String errorMessage;

  const LifeinsuranceRequestErrorState({required this.errorMessage});
}

final class LifeInsuranceSuccessState extends LifeinsuranceblocState {
  final Unit LifeInsuranceModel;

  const LifeInsuranceSuccessState({required this.LifeInsuranceModel});
}
