import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageController extends ChangeNotifier {
  Locale? _currentLocale;

  Locale? get currentLocale => _currentLocale;

  Future<void> setLocale(BuildContext context, Locale locale) async {
    if (_currentLocale == locale) return;

    _currentLocale = locale;
    await context.setLocale(locale);
    notifyListeners();
  }
}
