import 'package:flutter/material.dart';
import 'package:pasajeros/screens/home.dart';
import 'package:pasajeros/screens/login.dart';

import 'funciones/colores.dart';
import 'funciones/sesiones.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pasajeros TESA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PTSerif',
        primaryColor: inteco,
        brightness: Brightness.light,
        buttonTheme: ButtonThemeData(
          buttonColor: LIGHT_BLUE_COLOR,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/home':(context) => Home(),
      },
    );
  }
}