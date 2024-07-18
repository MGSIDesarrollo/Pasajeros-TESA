import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colores.dart';
import 'loopAnimation.dart';

menuItem(String option, IconData icon, BuildContext context, Widget page, Color color) {
  return Expanded(
    child: Padding(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page,),),
        child: Container(
          height: MediaQuery.sizeOf(context).height/4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(width: .2, color: DARK_BLUE_GHOST_COLOR),
            color: color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text(option, textAlign: TextAlign.center, style: TextStyle(color: LIGHT, fontSize: 22, fontFamily: 'PTSerif',))),
              SizedBox(height: 10,),
              Icon(icon, color: LIGHT, size: 45),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget emptyViajes = Center(child:
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ColorFiltered(
      colorFilter: ColorFilter.mode(DARK_BLUE_COLOR, BlendMode.srcIn),
      child: Image.asset('assets/icons/autobus.png', width: 100,),
    ),
    Text('No hay viajes asignados', style: TextStyle(color: DARK_BLUE_COLOR, fontFamily: 'PTSerif'),),
  ],),
);

Widget emptyGastos = Center(child:
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ColorFiltered(
      colorFilter: ColorFilter.mode(DARK_BLUE_COLOR, BlendMode.srcIn),
      child: Image.asset('assets/icons/factura.png', width: 100,),
    ),
    Text('No hay gastos que mostrar', style: TextStyle(color: DARK_BLUE_COLOR, fontFamily: 'PTSerif'),),
  ],),
);

Widget emptyHistorial = Center(child:
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ColorFiltered(
      colorFilter: ColorFilter.mode(DARK_BLUE_COLOR, BlendMode.srcIn),
      child: Image.asset('assets/icons/expediente.png', width: 100,),
    ),
    Text('No hay viajes por mostrar', style: TextStyle(color: DARK_BLUE_COLOR, fontFamily: 'PTSerif'),),
  ],),
);

Widget progressWidget(MyLoopAnimation _loopAnimation, double ancho){
  return Stack(children: [
    Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(width: ancho,
        child: Text(overflow: TextOverflow.clip, maxLines: 1, style: TextStyle(fontSize: 26, color: DARK_BLUE_COLOR), '---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'),
      ),
      Container(width: ancho,
        child: Text(overflow: TextOverflow.clip, maxLines: 1, style: TextStyle(fontSize: 26, color: DARK_BLUE_COLOR), '--   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   --   '),
      ),
      Container(width: ancho,
        child: Text(overflow: TextOverflow.clip, maxLines: 1, style: TextStyle(fontSize: 26, color: DARK_BLUE_COLOR), '---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'),
      ),
      Container(width: ancho,
        child: Text(style: TextStyle(fontSize: 16, color: DARK_BLUE_COLOR, fontFamily: 'PTSerif'), 'Cargando...', textAlign: TextAlign.center),
      ),
    ],),
    Positioned.fill(
      child: SlideTransition(
        position: _loopAnimation.animation,
        child: Row(
          children: [
            FadeInLeft(
              curve: Curves.easeInCirc,
              animate: true,
              duration: Duration(seconds: 5),
              child: FadeInImage(width: 80,
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/icons/autobus.png'),
                placeholder: AssetImage('assets/icons/autobus.png'),),),
          ],),),),
  ]);
}
