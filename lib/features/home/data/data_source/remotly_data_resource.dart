import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:globaladvice_new/features/home/data/model/car_policy_request_model.dart';
import 'package:globaladvice_new/features/home/data/model/health_insurance_model.dart';

import 'package:globaladvice_new/core/utils/api_helper.dart';
import 'package:globaladvice_new/core/utils/constant_api.dart';
import 'package:globaladvice_new/features/home/data/model/property_model.dart';

import 'package:globaladvice_new/features/home/data/model/life_insurance_model.dart';
import 'package:globaladvice_new/features/home/data/model/other_forms_model.dart';
import 'package:globaladvice_new/features/home/data/model/property_policy_request_model.dart';

import 'package:globaladvice_new/features/home/data/model/car_dependinces_model.dart';
import 'package:globaladvice_new/features/home/data/model/car_insurance_request_model.dart';
import 'package:globaladvice_new/features/home/data/model/health_dependinces_model.dart';
import 'package:globaladvice_new/features/home/data/model/property_dependinces_model.dart';

abstract class BaseHomeRemotelyDataSource {
  Future<Map<String, dynamic>> SendHealthInsuranceRequest(
      HealthInsuranceModel healthInsuranceModel);
  Future<Map<String, dynamic>> SendCarInsuranceRequest(
      CarInusranceRequestModel carInusranceRequest);
  Future<Map<String, dynamic>> SendPropertyInsuranceRequest(
      PropertyModel propertyModel);
  Future<Unit> SendLifeInsuranceRequest(LifeInsuranceModel lifeInsuranceModel);
  Future<Unit> SendAnotherInsuranceRequest(OtherFormsModel otherFormsModel);
  Future<Unit> CarPolicyRequest(CarPolicyrequestModel carPolicyRequest);
  Future<Unit> PropertyPolicyRequest(
      PropertyPolicyRequestModel propertyPolicyRequest);
  Future<List<CarDataModel>> Get_Car_Data();
  Future<List<PropertyDependincesDataModel>> Get_Property_Data();
  Future<List<HealthDependincesModel>> Get_Health_Data();
}

class HomeRemotelyDataSource extends BaseHomeRemotelyDataSource {
  @override
  Future<Map<String, dynamic>> SendHealthInsuranceRequest(
      HealthInsuranceModel healthInsuranceModel) async {
    final body = {
      "UID": healthInsuranceModel.uid,
      "phone": healthInsuranceModel.phone,
      "name[]": healthInsuranceModel.name,
      "age[]": healthInsuranceModel.age,
      "relation[]": healthInsuranceModel.relation,
      "healthLimit": healthInsuranceModel.healthLimit,
      "gender": healthInsuranceModel.gender,
      "healthBenefits[]": 17
    };
    print(body['phone']);
    print(body['name[]']);
    print(body['age[]']);
    print(body['relation[]']);
    print(body['healthLimit']);
    print(body['gender']);
    print(body['healthBenefits[]']);
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
        return jsonData; // Return response data
      } else {
        throw Exception('Request failed because ${jsonData['error']}');
      }
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "HealthInsurance Request");
    }
  }

  @override
  Future<Map<String, dynamic>> SendCarInsuranceRequest(
      CarInusranceRequestModel carInusranceRequest) async {
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
    print(body['UID']);
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
        return jsonData; // Return response data
      } else {
        throw Exception('Request failed because ${jsonData['error']}');
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
        return Future.value(unit);
      } else {
        throw Exception('Request failed because ${jsonData['error']}');
      }
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "LifeInsurance Request");
    }
  }

  @override
  Future<Map<String, dynamic>> SendPropertyInsuranceRequest(
      PropertyModel propertyModel) async {
    final body = {
      "UID": propertyModel.uid,
      "building_price": propertyModel.buildingPrice,
      "content_price": propertyModel.contentPrice,
      "type": propertyModel.type,
      "homeBenefits[]": propertyModel.homeBenefits,
      "phone": propertyModel.phone,
      "tenant_price": propertyModel.tenantPrice,
    };
    try {
      final response = await Dio().post(
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        ConstantApi.property,
        data: body,
      );
      Map<String, dynamic> jsonData = response.data;

      print(body['phone']);
      print(body['building_price']);
      print(body['tenant_price']);
      print(body['content_price']);
      print(body['type']);
      print(body['homeBenefits[]']);
      print(body['phone']);
      if (jsonData['status'] == 200) {
        print(jsonData);
        return jsonData; // Return response data
      } else {
        throw Exception('Request failed because ${jsonData['data']}');
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
        return Future.value(unit);
      } else {
        throw Exception('Request failed because ${jsonData['error']}');
      }
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "HealthInsurance Request");
    }
  }

  @override
  Future<List<CarDataModel>> Get_Car_Data() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));

    try {
      Response response = await dio.get(ConstantApi.car_dependencies);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> countriesJson = jsonResponse['data']["plans_data"];

        // Convert JSON list to List<CountriesModel>
        List<CarDataModel> countries = countriesJson.map((json) {
          return CarDataModel.fromJson(json);
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
  Future<List<PropertyDependincesDataModel>> Get_Property_Data() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));

    try {
      Response response = await dio.get(ConstantApi.property_dependencies);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> countriesJson = jsonResponse['data']["plans_data"];

        // Convert JSON list to List<CountriesModel>
        List<PropertyDependincesDataModel> countries = countriesJson.map((json) {
          return PropertyDependincesDataModel.fromJson(json);
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
  Future<Unit> CarPolicyRequest(CarPolicyrequestModel carPolicyRequest) async {
    final body = {
      "UID": carPolicyRequest.uID,
      "organization_id": carPolicyRequest.organizationId,
      "plan_id": carPolicyRequest.planId,
      "price": carPolicyRequest.price,
      "is_licensed": carPolicyRequest.isLicensed,
      "motorBrands": carPolicyRequest.motorBrands,
      "motorDeductibles": carPolicyRequest.motorDeductibles,
      "motorManufactureYear": carPolicyRequest.motorManufactureYear,
    };
    try {
      final response = await Dio().post(
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        ConstantApi.carpolicy,
        data: body,
      );
      Map<String, dynamic> jsonData = response.data;

      if (jsonData['status'] == 200) {
        print(jsonData);
        return Future.value(unit);
      } else {
        throw Exception('Request failed because ${jsonData['error']}');
      }
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "HealthInsurance Request");
    }
  }

  @override
  Future<Unit> PropertyPolicyRequest(
      PropertyPolicyRequestModel propertyPolicyRequest) async {
    final body = {
      "UID": propertyPolicyRequest.uID,
      "organization_id": propertyPolicyRequest.organizationId,
      "plan_id": propertyPolicyRequest.planId,
      "type": propertyPolicyRequest.type,
      "building_price": propertyPolicyRequest.building_price,
      "content_price": propertyPolicyRequest.content_price,
      "tenant_price": propertyPolicyRequest.tenant_price,
      "address": propertyPolicyRequest.address,
    };
    try {
      final response = await Dio().post(
        options: Options(
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        ConstantApi.propertypolicy,
        data: body,
      );
      Map<String, dynamic> jsonData = response.data;

      print(body['UID']);
      print(body['organization_id']);
      print(body['plan_id']);
      print(body['building_price']);
      print(body['tenant_price']);
      print(body['content_price']);
      print(body['type']);
      print(body['address']);

      if (jsonData['status'] == 200) {
        print(jsonData);
        return Future.value(unit);
      } else {
        throw Exception('Request failed because ${jsonData['data']}');
      }
    } on DioException catch (e) {
      throw DioHelper.handleDioError(
          dioError: e, endpointName: "HealthInsurance Request");
    }
  }

  @override
  Future<List<HealthDependincesModel>> Get_Health_Data() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true));

    try {
      Response response = await dio.get(ConstantApi.healthdata);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = response.data;
        final List<dynamic> countriesJson = jsonResponse['data']["plans_data"];

        // Convert JSON list to List<CountriesModel>
        List<HealthDependincesModel> health = countriesJson.map((json) {
          return HealthDependincesModel.fromJson(json);
        }).toList();

        return health;
      } else {
        throw Exception('Getting Car Data Failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching Car Data: ${e.toString()}');
    }
  }
}
