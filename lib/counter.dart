import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class Controller extends GetxController {
  var _box = GetStorage();


  var count;
  void increment() {
    _box.write("count", count);
    count =_box.read("count")??0;
    count++;
    // use update method to update all count variables
    update();
  }
}