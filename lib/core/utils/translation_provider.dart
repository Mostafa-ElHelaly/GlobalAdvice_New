import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TranslationProvider with ChangeNotifier {
  TranslationProvider(bool isArabic) {
    if (isArabic) {
      _locale = Locale('ar', '');
    } else {
      _locale = Locale('en', '');
    }
  }

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
}
