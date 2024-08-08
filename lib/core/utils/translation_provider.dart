import 'package:flutter/material.dart';
import 'package:globaladvice_new/features/home/data/data_source/remotly_data_resource.dart';
import 'package:globaladvice_new/features/home/presentation/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../../features/auth/data/data_source/remotly_data_source.dart';
import '../../features/auth/data/model/get_uid_model.dart';
import '../../features/auth/data/model/login_model.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/home/data/model/car_insurance_request_model.dart';
import '../../features/home/data/model/car_request_response_model.dart';

class TranslationProvider with ChangeNotifier {
  TranslationProvider(bool isArabic) {
    //}, bool isLogin, String uid_success) {
    if (isArabic) {
      _locale = Locale('ar', '');
    } else {
      _locale = Locale('en', '');
    }
    // if (isLogin) {
    //   is_Login = true;
    // } else {
    //   is_Login = false;
    // }
    // if (is_Login == true) {
    //   if (_response != null && _response!.data != null) {
    //     _response!.data!.uID = uid_success;
    //   }
    // } else {
    //   uid_success = 'none';
    // }
  }

  ApiResponse? _response;
  CarResponseModel? car_response;
  ApiResponse get response => _response!;
  Locale _locale = Locale('en', '');
  Locale get locale => _locale;
  void change_language() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_locale.languageCode == 'ar') {
      _locale = Locale('en', '');
      prefs.setBool("is_arabic", false);
    } else if (_locale.languageCode == 'en') {
      _locale = Locale('ar', '');
      prefs.setBool("is_arabic", true);
    }
    notifyListeners();
  }

  bool is_Login = false;
  Widget homePage = const LoginScreen();
  void check_login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isUser = prefs.getString('user_uid') != null;

    if (is_Login == false) {
      is_Login = true;
      homePage = const HomeScreen();
      prefs.setBool("is_login", true);
    } else if (is_Login == true) {
      is_Login = false;
      homePage = const LoginScreen();
      prefs.setBool("is_login", false);
    }
    notifyListeners();
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('user_uid');
  }

  void setUID(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('user_uid', uid);
  }

  void get_uid(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final authModel = LoginModel(email: email, password: password);
      final response =
          await AuthRemotelyDateSource().loginWithEmailAndPassword(authModel);

      _response = ApiResponse.fromJson(response);
      prefs.setString("user_uid", _response!.data!.uID!);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
