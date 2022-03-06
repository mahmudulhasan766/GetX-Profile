import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

import 'main.dart';

class Controller extends GetxController {


var counter;
  void increment(){
     counter =(box.read("counter")??1)+1;
    // use update method to update all count variables
     box.write('counter',counter);
    update();
  }
}