import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  static Map<String, Map<String, String>> translations = {};

  static Future<void> load() async {
    final enJson = await rootBundle.loadString('lib/core/localization/strings/en.json');
    final arJson = await rootBundle.loadString('lib/core/localization/strings/ar.json');

    translations['en'] = Map<String, String>.from(json.decode(enJson));
    translations['ar'] = Map<String, String>.from(json.decode(arJson));
  }

  @override
  Map<String, Map<String, String>> get keys => translations;
}
