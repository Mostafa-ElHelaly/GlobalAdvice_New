import 'package:dartz/dartz.dart';
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
  Future<Unit> loginWithEmailAndPassword(LoginModel authModel);

  Future<LoginModel> registerWithEmailAndPassword(
      RegisterAuthModel registerAuthModel);

  Future<Unit> resetPasswordWithEmail(String email);
}

class AuthRemotelyDateSource extends BaseRemotelyDataSource {
  @override
  Future<Unit> loginWithEmailAndPassword(LoginModel authModel) async {
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
        print('reset password success');
        return Future.value(unit);
      } else {
        throw Exception(Strings.resetPasswordFailed);
      }
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
      "password": registerAuthModel.password,
      "phone": registerAuthModel.phone,
      "name": registerAuthModel.name,
    };

    try {
      final response = await Dio().post(
        ConstantApi.register,
        data: FormData.fromMap(body),
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
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
      return authModelResponse;
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
