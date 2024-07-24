import 'package:bloc/bloc.dart';
import 'package:globaladvice_new/features/auth/presentation/manager/register_bloc/register_event.dart';
import 'package:globaladvice_new/features/auth/presentation/manager/register_bloc/register_state.dart';

import '../../../../../core/utils/api_helper.dart';
import '../../../data/model/login_model.dart';
import '../../../domain/use_case/register_uc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterUseCase registerUseCase;

  RegisterBloc({required this.registerUseCase}) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      emit(const RegisterLoadingState());
      final result = await registerUseCase.call(LoginModel(
        email: event.email,
        password: event.password,
        name: event.name,
        telephone: event.telephone,
      ));
      print(result);
      result.fold(
          (l) => emit(RegisterSuccessState(
                authModelResponse: l,
              )),
          (r) => emit(RegisterErrorState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
