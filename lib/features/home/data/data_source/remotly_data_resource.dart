import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:globaladvice_new/features/home/data/model/healthInsuranceModel.dart';

import 'package:globaladvice_new/core/error/failures_strings.dart';
import 'package:globaladvice_new/core/utils/api_helper.dart';
import 'package:globaladvice_new/core/utils/constant_api.dart';

import '../model/lifeInsurance.dart';
import '../model/other_forms_model.dart';

abstract class BaseHomeRemotelyDataSource {
  Future<Unit> sendhealthinsurancerequest(
      HealthInsuranceModel healthInsuranceModel);
  Future<Unit> sendcarinsurancerequest(
      HealthInsuranceModel healthInsuranceModel);
  Future<Unit> sendpropertyinsurancerequest(
      HealthInsuranceModel healthInsuranceModel);
  Future<Unit> SendLifeInsuranceRequest(
      LifeInsuranceModel lifeInsuranceModel);
  Future<Unit> sendanotherinsurancerequest(OtherFormsModel otherFormsModel);
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
        ConstantApi.healthInsurance,
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
        ConstantApi.healthInsurance,
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
  Future<Unit> SendLifeInsuranceRequest(
      LifeInsuranceModel lifeInsuranceModel) async {
    final body = {
      "UID": lifeInsuranceModel.uid,
      "email": lifeInsuranceModel.email,
      "name": lifeInsuranceModel.name,
      "phone": lifeInsuranceModel.phone,
      "body": lifeInsuranceModel.body,
    };
    try {
      final response = await Dio().post(
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        ConstantApi.lifeInsurance,
        data: body,
      );
      if (response.statusCode == 200) {
        print('Send success');
        return Future.value(unit);
      } else {
        throw Exception(Strings.resetPasswordFailed);
      }
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "LifeInsurance Request");
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
        ConstantApi.healthInsurance,
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
  Future<Unit> sendanotherinsurancerequest(
      OtherFormsModel otherFormsModel) async {
    final body = {
      "name": otherFormsModel.name,
      "contact": otherFormsModel.phoneNumber,
      "type": otherFormsModel.type,
      "message": otherFormsModel.message,
    };
    try {
      final response = await Dio().post(
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        ConstantApi.form,
        data: body,
      );
      if (response.statusCode == 200) {
        print('Request Sent Successfully');
        return Future.value(unit);
      } else {
        throw Exception(Strings.requestfalied);
      }
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "HealthInsurance Request");
    }
  }








}
