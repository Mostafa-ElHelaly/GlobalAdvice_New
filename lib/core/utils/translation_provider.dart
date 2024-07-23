import 'package:flutter/material.dart';

class TranslationProvider with ChangeNotifier {
  Locale _locale = Locale('en', '');
  Locale get locale => _locale;
  void change_language() async {
    if (_locale.languageCode == 'ar') {
      _locale = Locale('en', '');
    } else if (_locale.languageCode == 'en') {
      _locale = Locale('ar', '');
    }
    notifyListeners();
  }
}
