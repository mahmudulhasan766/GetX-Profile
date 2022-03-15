import 'package:get/get.dart';
import 'package:getx_profile/Language_Change/language_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LanguageController(), permanent: true);
  }
}
