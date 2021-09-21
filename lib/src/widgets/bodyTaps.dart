import 'package:flutter/material.dart';
import 'package:scan_app/src/pages/direcciones_page.dart';
import 'package:scan_app/src/pages/mapas_page.dart';

class BodyTaps {

  static Widget? getPage(int index)  {
    switch(index){

      case 0: return MapasPage();
      case 1: return DireccionesPage();

      default:
        return MapasPage();
    }
  }
}
