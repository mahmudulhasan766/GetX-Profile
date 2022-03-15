import 'package:get/get.dart';
import 'package:getx_profile/Language_Change/language_file/english.dart';
import 'package:getx_profile/Language_Change/language_file/japanese.dart';
import 'package:getx_profile/Language_Change/language_file/turkish.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'de_DE': jaJP,
    'pt_BR': trTR,
  };
}