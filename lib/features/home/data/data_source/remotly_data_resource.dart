import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:globaladvice_new/features/home/data/model/health_insurance_model.dart';

import 'package:globaladvice_new/core/error/failures_strings.dart';
import 'package:globaladvice_new/core/utils/api_helper.dart';
import 'package:globaladvice_new/core/utils/constant_api.dart';
import 'package:globaladvice_new/features/home/data/model/property_model.dart';

import 'package:globaladvice_new/features/home/data/model/life_insurance_model.dart';
import 'package:globaladvice_new/features/home/data/model/other_forms_model.dart';

import '../model/car_dependinces_model.dart';
import '../model/car_insurance_request_model.dart';
import '../model/property_dependinces_model.dart';

abstract class BaseHomeRemotelyDataSource {
  Future<Unit> SendHealthInsuranceRequest(
      HealthInsuranceModel healthInsuranceModel);
  Future<Unit> SendCarInsuranceRequest(CarInusranceRequest carInusranceRequest);
  Future<Unit> SendPropertyInsuranceRequest(PropertyModel propertyModel);
  Future<Unit> SendLifeInsuranceRequest(LifeInsuranceModel lifeInsuranceModel);
  Future<Unit> SendAnotherInsuranceRequest(OtherFormsModel otherFormsModel);
  Future<List<CarData>> Get_Car_Data();
  Future<List<PropertyDependincesData>> Get_Property_Data();
}

class HomeRemotelyDataSource extends BaseHomeRemotelyDataSource {
  @override
  Future<Unit> SendHealthInsuranceRequest(
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
  Future<Unit> SendCarInsuranceRequest(
      CarInusranceRequest carInusranceRequest) async {
    final body = {
      'UID': carInusranceRequest.uid,
      'price': carInusranceRequest.price,
      'is_licensed': carInusranceRequest.isLicensed,
      'motorBrands': carInusranceRequest.motorBrands,
      'motorDeductibles': carInusranceRequest.motorDeductibles,
      'motorManufactureYear': carInusranceRequest.motorManufactureYear,
      'phone': carInusranceRequest.phone,
    };
    print(body['price']);
    print(body['is_licensed']);
    print(body['motorBrands']);
    print(body['motorDeductibles']);
    print(body['motorManufactureYear']);
    print(body['phone']);

    try {
      final response = await Dio().post(
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        ConstantApi.car,
        data: body,
      );
      Map<String, dynamic> jsonData = response.data;

      if (jsonData['status'] == 200) {
        print(jsonData);
        print('Sending Car Insurance Request Successfully');
        return Future.value(unit);
      } else {
        throw Exception('Sending Car Insurance Request Failed');
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
      Map<String, dynamic> jsonData = response.data;

      if (jsonData['status'] == 200) {
        print(jsonData);
        print('Sending Car Insurance Request Successfully');
        return Future.value(unit);
      } else {
        throw Exception('Sending Car Insurance Request Failed');
      }
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "LifeInsurance Request");
    }
  }

  @override
  Future<Unit> SendPropertyInsuranceRequest(PropertyModel propertyModel) async {
    final body = {
      "UID": propertyModel.uid,
      "building_price": propertyModel.buildingPrice,
      "content_price": propertyModel.contentPrice,
      "type": propertyModel.type,
      "homeBenefits[]": propertyModel.homeBenefits,
      "phone": propertyModel.phone,
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
      Map<String, dynamic> jsonData = response.data;

      if (jsonData['status'] == 200) {
        print(jsonData);
        print('Sending Car Insurance Request Successfully');
        return Future.value(unit);
      } else {
        throw Exception('Sending Car Insurance Request Failed');
      }
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "HealthInsurance Request");
    }
  }

  @override
  Future<Unit> SendAnotherInsuranceRequest(
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
      Map<String, dynamic> jsonData = response.data;

      if (jsonData['status'] == 200) {
        print(jsonData);
        print('Sending Car Insurance Request Successfully');
        return Future.value(unit);
      } else {
        throw Exception('Sending Car Insurance Request Failed');
      }
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "HealthInsurance Request");
    }
  }

  @override
  Future<List<CarData>> Get_Car_Data() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));

    try {
      Response response = await dio.get(ConstantApi.car_dependencies);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> countriesJson = jsonResponse['data']["plans_data"];

        // Convert JSON list to List<CountriesModel>
        List<CarData> countries = countriesJson.map((json) {
          return CarData.fromJson(json);
        }).toList();

        return countries;
      } else {
        throw Exception('Getting Car Data Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching Car Data: ${e.toString()}');
    }
  }

  @override
  Future<List<PropertyDependincesData>> Get_Property_Data() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));

    try {
      Response response = await dio.get(ConstantApi.property_dependencies);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> countriesJson = jsonResponse['data']["plans_data"];

        // Convert JSON list to List<CountriesModel>
        List<PropertyDependincesData> countries = countriesJson.map((json) {
          return PropertyDependincesData.fromJson(json);
        }).toList();

        return countries;
      } else {
        throw Exception('Getting Car Data Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching Car Data: ${e.toString()}');
    }
  }
}
