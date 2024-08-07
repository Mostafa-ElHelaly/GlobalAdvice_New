import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:globaladvice_new/core/utils/api_helper.dart';
import 'package:globaladvice_new/core/utils/constant_api.dart';
import 'package:globaladvice_new/core/utils/methods.dart';
import 'package:globaladvice_new/features/auth/data/model/login_model.dart';
import 'package:globaladvice_new/core/error/failures_strings.dart';

abstract class BaseRemotelyDataSource {
  Future<Map<String, dynamic>> loginWithEmailAndPassword(LoginModel authModel);

  Future<Unit> registerWithEmailAndPassword(LoginModel registerAuthModel);

  Future<Unit> resetPasswordWithEmail(String email);
}

class AuthRemotelyDateSource extends BaseRemotelyDataSource {
  @override
  Future<Map<String, dynamic>> loginWithEmailAndPassword(
      LoginModel authModel) async {
    final body = {
      "email": authModel.email,
      "password": authModel.password,
    };

    try {
      final response = await Dio().post(
        options: Options(
          headers: {
            'Content-Type': Headers.formUrlEncodedContentType,
          },
        ),
        ConstantApi.login,
        data: FormData.fromMap(body),
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = response.data;
        return jsonData; // Return response data
      } else {
        throw Exception('Login failed with status code ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "loginWithEmailAndPassword");
    }
  }

  @override
  Future<Unit> registerWithEmailAndPassword(
      LoginModel registerAuthModel) async {
    final body = {
      "email": registerAuthModel.email,
      "password": registerAuthModel.password,
      "phone": registerAuthModel.telephone,
      "name": registerAuthModel.name,
    };
    print(body['email']);
    print(body['password']);
    print(body['phone']);
    print(body['name']);

    try {
      final response = await Dio().post(
        ConstantApi.register,
        data: FormData.fromMap(body),
        options: Options(
          headers: {
            'Content-Type': Headers.formUrlEncodedContentType,
          },
        ),
      );
      Map<String, dynamic> jsonData = response.data;

      if (jsonData['status'] != 200) {
        print(jsonData);
        throw new Exception(jsonData['error']);
      }

      LoginModel authModelResponse = LoginModel.fromJson(jsonData);

      Methods.instance.saveUserToken(authToken: authModelResponse.token);
      return Future.value(unit);
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "RegisterWithEmailAndPassword");
    }
  }

  @override
  Future<Unit> resetPasswordWithEmail(String email) async {
    final body = {
      "email": email,
    };
    try {
      final response = await Dio().post(
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        ConstantApi.resetPassword,
        data: body,
      );
      if (response.statusCode == 200) {
        print('reset password success');
        return Future.value(unit);
      } else {
        throw Exception(Strings.resetPasswordFailed);
      }
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "Reset Password");
    }
  }
}
