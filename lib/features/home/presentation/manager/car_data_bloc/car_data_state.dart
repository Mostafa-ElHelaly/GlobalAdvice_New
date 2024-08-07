import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../data/model/car_dependinces_model.dart';

abstract class CarDataState extends Equatable {
  const CarDataState();

  @override
  List<Object> get props => [];
}

final class CarDataInitial extends CarDataState {}

final class CarDataLoadingState extends CarDataState {
  const CarDataLoadingState();
}

final class CarDataErrorState extends CarDataState {
  final String errorMessage;

  const CarDataErrorState({required this.errorMessage});
}

final class CarDataSuccessState extends CarDataState {
  final List<CarData> CarDependinces;
  const CarDataSuccessState(this.CarDependinces);
}
