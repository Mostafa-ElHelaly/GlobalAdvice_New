import 'package:dio/dio.dart';
import 'package:globaladvice_new/core/utils/api_helper.dart';
import 'package:globaladvice_new/core/utils/constant_api.dart';
import 'package:globaladvice_new/core/utils/methods.dart';
import 'package:globaladvice_new/features/auth/data/model/login_model.dart';

import '../../domain/use_case/login_uc.dart';
import '../../domain/use_case/register_uc.dart';
import '../../domain/use_case/reset_password_us.dart';
import '../model/reset_password_model.dart';

abstract class BaseRemotelyDataSource {
  Future<LoginModel> loginWithEmailAndPassword(LoginModel authModel);

  Future<LoginModel> registerWithEmailAndPassword(LoginModel registerAuthModel);

  Future<LoginModel> resetPasswordWithEmail(LoginModel resetModel);
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
  Future<LoginModel> resetPasswordWithEmail(LoginModel resetModel) async {
    final body = {
      "email": resetModel.email,
    };

    try {
      final response = await Dio().post(
        ConstantApi.resetPassword,
        data: body,
      );
      Map<String, dynamic> jsonData = response.data;

      LoginModel authModelResponse = LoginModel.fromJson(jsonData);

      Methods.instance.saveUserToken(authToken: authModelResponse.token);
      return authModelResponse;
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "Reset Password");
    }
  }
}
