import 'package:dio/dio.dart';
import 'package:globaladvice_new/core/utils/api_helper.dart';
import 'package:globaladvice_new/core/utils/constant_api.dart';
import 'package:globaladvice_new/core/utils/methods.dart';
import 'package:globaladvice_new/features/auth/data/model/login_model.dart';

import '../../domain/use_case/login_uc.dart';
import '../../domain/use_case/register_uc.dart';

abstract class BaseRemotelyDataSource {
  Future<LoginModel> loginWithEmailAndPassword(AuthModel authModel);

  Future<LoginModel> registerWithEmailAndPassword(
      RegisterAuthModel registerAuthModel);
}

class AuthRemotelyDateSource extends BaseRemotelyDataSource {
  @override
  Future<LoginModel> loginWithEmailAndPassword(AuthModel authModel) async {
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
      RegisterAuthModel registerAuthModel) async {
    final body = {
      "email": registerAuthModel.email,
      "password": registerAuthModel.password,};

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
}
