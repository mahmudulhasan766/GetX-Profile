import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';
import 'datastorage_service.dart';

class LanguageController extends GetxController {
  final storage = Get.find<StorageService>();
  final RxString locale = Get.locale.toString().obs;

  final Map<String, dynamic> optionsLocales = {
    'en_US': {
      'languageCode': 'en',
      'countryCode': 'US',
      'description': 'English'
    },
    'de_DE': {
      'languageCode': 'de',
      'countryCode': 'DE',
      'description': 'German'
    },
    'pt_BR': {
      'languageCode': 'pt',
      'countryCode': 'BR',
      'description': 'Português'
    },
  };

  void updateLocale(String? key) {
    final String languageCode = optionsLocales[key]['languageCode'];
    final String countryCode = optionsLocales[key]['countryCode'];
    // Update App
    Get.updateLocale(Locale(languageCode, countryCode));
    // Update obs
    locale.value = Get.locale.toString();
    // Update storage
    storage.write('languageCode', languageCode);
    storage.write('countryCode', countryCode);
  }
}