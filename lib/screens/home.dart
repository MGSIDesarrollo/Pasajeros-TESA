import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:pasajeros/screens/reglamento.dart';
import 'package:pasajeros/screens/seguimiento.dart';

import '../DBlocal/consultas.dart';
import '../conexion/conn.dart';
import '../funciones/alertas.dart';
import '../funciones/colores.dart';
import '../funciones/request.dart';
import '../funciones/widgets.dart';
import 'informacion.dart';


class Home extends StatefulWidget {

  static const routeName = '/Home';
  Home({Key? key,}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  bool? _save;
  Map? _arguments;

  @override
  void initState(){
    super.initState();

    //isInteret();
    Conn.isInternet().then((connection){
      if(connection){

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return
      Scaffold(
        appBar: AppBar(
         foregroundColor: LIGHT,
         title: Center(
           child: Image.asset(
             "assets/images/logo_tesa.png",
             height: MediaQuery.sizeOf(context).height * 0.05,
             fit: BoxFit.cover,
           ),
         ),
         backgroundColor: DARK_BLUE_COLOR,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(children: [
                  menuItem('Código QR', Icons.qr_code_2_outlined, context, Codigo(info: _arguments!['datos'],), DARK_BLUE_GHOST_COLOR),
                  menuItem('Ruta', Icons.pin_drop, context, Ruta(info: _arguments!['datos']), Colors.blue),
                ],),
                Row(children: [
                  menuItem('Reglamento', Icons.newspaper, context, ReglamentoPasajeros(), Colors.grey),
                  Expanded(child: Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 0), child: Container(height: MediaQuery.sizeOf(context).height/4, child: Text(''),))),
                ],),
                SizedBox(height: 10,),
              ],),
            ),
          ),
      );
  }


  /*Future<String?> isInteret()async{
    await Conn.isInternet().then((connection){
      if (connection) {
        //showToast(context, 'Sincronización de gastos realizada correctamente', background: Colors.blueGrey);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
              children: <Widget>[
                Icon(
                  Icons.wifi,
                  color: Colors.white,
                ),
                Text("       Conectado a Internet")
              ]
          ),
        ));
      }else{
        //showToast(context, 'Sincronización de gastos realizada correctamente', background: Colors.blueGrey);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(
              children: <Widget>[
                Text("En este momento no tienes conexión a Internet")
              ]
          ),
        ));
      }
    });
  }*/
}