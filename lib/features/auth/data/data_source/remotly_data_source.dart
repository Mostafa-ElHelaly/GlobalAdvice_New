import 'package:dio/dio.dart';
import 'package:globaladvice_new/core/utils/api_helper.dart';
import 'package:globaladvice_new/core/utils/constant_api.dart';
import 'package:globaladvice_new/core/utils/methods.dart';
import 'package:globaladvice_new/features/auth/data/model/login_model.dart';
import 'package:globaladvice_new/features/auth/presentation/manager/reset_password_bloc/bloc/reset_password_state.dart';

import '../../../../core/error/failures_strings.dart';
import '../../domain/use_case/login_uc.dart';
import '../../domain/use_case/register_uc.dart';
import '../../domain/use_case/reset_password_us.dart';
import '../model/reset_password_model.dart';

abstract class BaseRemotelyDataSource {
  Future<LoginModel> loginWithEmailAndPassword(LoginModel authModel);

  Future<LoginModel> registerWithEmailAndPassword(LoginModel registerAuthModel);

  Future<ResetPasswordModel> resetPasswordWithEmail(
      ResetPasswordModel resetPasswordModel);
}

class AuthRemotelyDateSource extends BaseRemotelyDataSource {
  @override
  Future<LoginModel> loginWithEmailAndPassword(LoginModel authModel) async {
    final body = {"email": authModel.email, "password": authModel.password};

    try {
      final response = await Dio().post(
        ConstantApi.login,
        data: body,
      );
      Map<String, dynamic> jsonData = response.data;

      LoginModel authModelResponse = LoginModel.fromJson(jsonData);

      Methods.instance.saveUserToken(authToken: authModelResponse.token);
      return authModelResponse;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "loginWithEmailAndPassword");
    }
  }

  @override
  Future<LoginModel> registerWithEmailAndPassword(
      LoginModel registerAuthModel) async {
    final body = {
      "email": registerAuthModel.email,
      "password": registerAuthModel.password,
      "birthdate": registerAuthModel.birthdate,
      "gender": registerAuthModel.gender,
      "confirmPassword": registerAuthModel.confirmPassword,
    };

    try {
      final response = await Dio().post(
        ConstantApi.register,
        data: body,
      );
      Map<String, dynamic> jsonData = response.data;

      LoginModel authModelResponse = LoginModel.fromJson(jsonData);

      Methods.instance.saveUserToken(authToken: authModelResponse.token);
      return authModelResponse;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "RegisterWithEmailAndPassword");
    }
  }

  @override
  Future<ResetPasswordModel> resetPasswordWithEmail(
      ResetPasswordModel resetPasswordModel) async {
    final body = {
      "email": resetPasswordModel.data!.email,
    };
    try {
      final response = await Dio().post(
        ConstantApi.resetPassword,
        data: body,
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = response.data;

        ResetPasswordModel resetresponse =
            ResetPasswordModel.fromJson(jsonData);

        print('resetPasswordWithEmail is success');
        return resetresponse;
      } else {
        throw Exception(Strings.resetPasswordFailed);
      }
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "Reset Password");
    }
  }
}
