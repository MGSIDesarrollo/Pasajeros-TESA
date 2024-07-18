import 'package:path/path.dart' as path;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Conn {

  static Future<bool> isInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      if (await InternetConnectionChecker().hasConnection) {
        print("Conexión con datos móviles detectada");
        return true;
      } else {
        print('Sin conexión a internet... Razon: ');
        return false;
      }
    } else if (connectivityResult == ConnectivityResult.wifi) {
      if (await InternetConnectionChecker().hasConnection) {
        print("Conexión con wifi detectada");
        return true;
      } else {
        print('Sin conexión a internet... Razon: ');
        return false;
      }
    } else {
      print("No se detectó ninguna conexión a Internet.");
      return false;
    }
  }
}
