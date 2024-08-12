import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

sealed class CarPolicyblocState extends Equatable {
  const CarPolicyblocState();

  @override
  List<Object> get props => [];
}

final class CarPolicyblocInitial extends CarPolicyblocState {}

final class CarPolicyRequestLoadingState extends CarPolicyblocState {
  const CarPolicyRequestLoadingState();
}

final class CarPolicyRequestErrorState extends CarPolicyblocState {
  final String errorMessage;

  const CarPolicyRequestErrorState({required this.errorMessage});
}

final class CarPolicySuccessState extends CarPolicyblocState {
  final Unit CarPolicyModel;

  const CarPolicySuccessState({required this.CarPolicyModel});
}
