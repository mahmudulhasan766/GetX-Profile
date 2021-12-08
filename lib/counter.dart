import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Controller extends GetxController {
  int count = 0;
  void increment() {
    count++;
    // use update method to update all count variables
    update();
  }
}