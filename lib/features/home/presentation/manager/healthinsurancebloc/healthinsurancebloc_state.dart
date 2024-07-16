part of 'healthinsurancebloc_bloc.dart';

sealed class HealthinsuranceblocState extends Equatable {
  const HealthinsuranceblocState();
  
  @override
  List<Object> get props => [];
}

final class HealthinsuranceblocInitial extends HealthinsuranceblocState {}
