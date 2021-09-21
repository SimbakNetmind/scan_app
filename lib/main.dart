import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan_app/src/pages/home_page.dart';
import 'package:scan_app/src/pages/mapa_page.dart';
import 'package:scan_app/src/pages/mapas_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(

            appBarTheme:AppBarTheme(
                color: Colors.deepPurple
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurple
            )
        ),
      title: 'Material App',
      initialRoute: "home",
      routes: {
          "home":(BuildContext context)=>HomePage(),
          "mapa": (BuildContext context)=>MapaPage()
      },
    );
  }
}
