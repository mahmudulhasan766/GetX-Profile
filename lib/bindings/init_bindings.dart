import 'package:get/get.dart';
import 'package:getx_profile/Language_Change/language_controller.dart';
import 'package:getx_profile/controller/internet_connectivity.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LanguageController(), permanent: true);
    Get.put(InternetConectivityController());
  }
}
