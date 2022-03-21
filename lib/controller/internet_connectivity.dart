import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getx_profile/src/first_screen.dart';
import 'package:getx_profile/src/nointernet.dart';

class InternetConectivityController extends GetxController
{
  //this variable 0 = No Internet, 1 = connected to WIFI ,2 = connected to Mobile Data.
  int connectionType = 0;
  //Instance of Flutter Connectivity
  final Connectivity _connectivity = Connectivity();
  //Stream to keep listening to network change state
  late StreamSubscription _streamSubscription ;

  @override
  void onInit() {
    GetConnectionType();
    _streamSubscription = _connectivity.onConnectivityChanged.listen(_updateState);
  }
  // a method to get which connection result, if you we connected to internet or no if yes then which network
  Future<void>GetConnectionType() async{
    var connectivityResult;
    try{
      connectivityResult = await (_connectivity.checkConnectivity());
    }on PlatformException catch(e){
      print(e);
    }
    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult result)
  {
    switch(result)
    {
      case ConnectivityResult.wifi:
        connectionType=1;
        Get.to(First());
        update();
        break;
      case ConnectivityResult.mobile:
        connectionType=2;
        Get.to(First());
        update();
        break;
      case ConnectivityResult.none:
        connectionType=0;
        Get.to(NoInternet());
        update();
        break;
      default: Get.snackbar('Network Error', 'Failed to get Network Status');
      break;
    }
  }
  @override
  void onClose() {
    //stop listening to network state when app is closed
    _streamSubscription.cancel();
  }
}