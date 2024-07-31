import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:globaladvice_new/features/home/data/model/healthInsuranceModel.dart';
import 'package:globaladvice_new/main.dart';

import '../../../../core/error/failures_strings.dart';
import '../../../../core/utils/api_helper.dart';
import '../../../../core/utils/constant_api.dart';

abstract class BaseHomeRemotelyDataSource {
  Future<Unit> sendhealthinsurancerequest(
      HealthInsuranceModel healthInsuranceModel);
  Future<Unit> sendcarinsurancerequest(
      HealthInsuranceModel healthInsuranceModel);
  Future<Unit> sendpropertyinsurancerequest(
      HealthInsuranceModel healthInsuranceModel);
  Future<Unit> sendlifeinsurancerequest(
      HealthInsuranceModel healthInsuranceModel);
}

class HomeRemotelyDataSource extends BaseHomeRemotelyDataSource {
  @override
  Future<Unit> sendhealthinsurancerequest(
      HealthInsuranceModel healthInsuranceModel) async {
    final body = {
      "UID": healthInsuranceModel.uid,
      "organization_id": healthInsuranceModel.organizationId,
      "plan_id": healthInsuranceModel.planId,
      "name[]": healthInsuranceModel.name,
      "age[]": healthInsuranceModel.age,
      "relation[]": healthInsuranceModel.relation,
      "price[]": healthInsuranceModel.price,
      "gender[]": healthInsuranceModel.gende,
    };
    try {
      final response = await Dio().post(
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        ConstantApi.healthinsurance,
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
          dioError: e, endpointName: "HealthInsurance Request");
    }
  }

  @override
  Future<Unit> sendcarinsurancerequest(
      HealthInsuranceModel healthInsuranceModel) async {
    final body = {
      "UID": healthInsuranceModel.uid,
      "organization_id": healthInsuranceModel.organizationId,
      "plan_id": healthInsuranceModel.planId,
      "name[]": healthInsuranceModel.name,
      "age[]": healthInsuranceModel.age,
      "relation[]": healthInsuranceModel.relation,
      "price[]": healthInsuranceModel.price,
      "gender[]": healthInsuranceModel.gende,
    };
    try {
      final response = await Dio().post(
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        ConstantApi.healthinsurance,
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
          dioError: e, endpointName: "HealthInsurance Request");
    }
  }

  @override
  Future<Unit> sendlifeinsurancerequest(
      HealthInsuranceModel healthInsuranceModel) async {
    final body = {
      "UID": healthInsuranceModel.uid,
      "organization_id": healthInsuranceModel.organizationId,
      "plan_id": healthInsuranceModel.planId,
      "name[]": healthInsuranceModel.name,
      "age[]": healthInsuranceModel.age,
      "relation[]": healthInsuranceModel.relation,
      "price[]": healthInsuranceModel.price,
      "gender[]": healthInsuranceModel.gende,
    };
    try {
      final response = await Dio().post(
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        ConstantApi.healthinsurance,
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
          dioError: e, endpointName: "HealthInsurance Request");
    }
  }

  @override
  Future<Unit> sendpropertyinsurancerequest(
      HealthInsuranceModel healthInsuranceModel) async {
    final body = {
      "UID": healthInsuranceModel.uid,
      "organization_id": healthInsuranceModel.organizationId,
      "plan_id": healthInsuranceModel.planId,
      "name[]": healthInsuranceModel.name,
      "age[]": healthInsuranceModel.age,
      "relation[]": healthInsuranceModel.relation,
      "price[]": healthInsuranceModel.price,
      "gender[]": healthInsuranceModel.gende,
    };
    try {
      final response = await Dio().post(
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        ConstantApi.healthinsurance,
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
          dioError: e, endpointName: "HealthInsurance Request");
    }
  }
}
