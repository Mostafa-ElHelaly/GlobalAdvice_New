import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'healthinsurancebloc_event.dart';
part 'healthinsurancebloc_state.dart';

class HealthinsuranceblocBloc extends Bloc<HealthinsuranceblocEvent, HealthinsuranceblocState> {
  HealthinsuranceblocBloc() : super(HealthinsuranceblocInitial()) {
    on<HealthinsuranceblocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
