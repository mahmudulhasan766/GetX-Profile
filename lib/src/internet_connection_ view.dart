import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_profile/controller/internet_connectivity.dart';
import 'package:getx_profile/src/nointernet.dart';

import 'first_screen.dart';

class InternetConnectionView extends StatelessWidget {
   InternetConnectionView({Key? key}) : super(key: key);

  //final InternetConectivityController _conectivityController= Get.find<InternetConectivityController>();

  @override
  Widget build(BuildContext context) {
    // return GetBuilder<InternetConectivityController>(
    //     builder: (controller){
    //       print("gdfk");
    //      // return Text((controller.connectionType == 0 )? 'No Internet' : (controller.connectionType == 1) ? 'You are Connected to Wifi' : 'You are Connected to Mobile Internet',style: TextStyle(fontSize: 30),);
    //         //return controller.connectionType == 0?NoInternet():First();
    //       return Text("dgfdf");
    //     }
    //);
    return Scaffold(
      body: Center(
        child: Text("Connectivity"),
      ),
    );


  }
}
