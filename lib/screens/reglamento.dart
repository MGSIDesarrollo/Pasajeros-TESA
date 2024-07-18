import 'package:flutter/material.dart';

import '../funciones/colores.dart';

class ReglamentoPasajeros extends StatefulWidget {
  ReglamentoPasajeros({Key? key,}) : super(key: key);

  @override
  _ReglamentoPasajerosState createState() => _ReglamentoPasajerosState();
}

class _ReglamentoPasajerosState extends State<ReglamentoPasajeros> {

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/images/logo_tesa.png",
              height: MediaQuery.sizeOf(context).height * 0.05,
              fit: BoxFit.cover,
            ),
          ),
        ),
        backgroundColor: DARK_BLUE_COLOR
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(padding: EdgeInsets.all(10),
            child: _body(),),
        ]),
      ),
    );
  }

  Widget _body() {
    return Card(
      color: Colors.white,
      borderOnForeground: true,
      elevation: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 6,),
          titulo('REGLAMENTO PARA USUARIOS DE TRANSPORTE'),
          Divider(color: Colors.black, indent: 15, endIndent: 15,),
          _rowText('1.- ',  '🚫👊 Respeta al conductor y a los compañeros. No insultes ni agredas a nadie.'),
          _rowText('2.- ', '🚗🛑 No distraigas al conductor.'),
          _rowText('3.- ', '🚍✋ No te levantes de tu asiento hasta que la unidad se detenga completamente.'),
          _rowText('4.- ', '🚭 No fumar dentro de las unidades.'),
          _rowText('5.- ', '🚫🍔 No se permite comer o beber dentro de las unidades.'),
          _rowText('6.- ', '🚫🪑 No apartes asientos para los compañeros.'),
          _rowText('7.- ', '🚫🖐️ No saques los brazos o la cabeza por las ventanillas.'),
          _rowText('8.- ', '🚫🗣️ No uses palabras altisonantes ni silbes a las personas en la vía pública.'),
          _rowText('9.- ', '🚫🚹 No te sientes en las coderas.'),
          _rowText('10.- ', '🚫🤸‍♂️ No te hincas ni saltes en los asientos.'),
          _rowText('11.- ', '🎟️🔍 Porta tu gafete de la empresa en un lugar visible (a la altura del tórax) para abordar la unidad.'),
          _rowText('12.- ', '🚫👥 Las unidades son para uso exclusivo del personal de la empresa. No se permite el abordo de acompañantes no relacionados con el trabajo.'),
          _rowText('13.- ', '🧹 Mantén limpia la unidad de transporte.'),
          _rowText('14.- ', '🚫🛠️ No dañes la unidad.'),
          _rowText('15.- ', '🚫🚪 No azotes las puertas.'),
          _rowText('16.- ', '🚫❤️ No des muestras de cariño (besos y abrazos de pareja).'),
          _rowText('17.- ', '🔗🚍 Al abordar la unidad, coloca el cinturón de seguridad hasta el término de la ruta o descenso de la unidad.'),
          _rowText('18.- ', '🚫🔫 Está estrictamente prohibido abordar la unidad con armas.'),
          Text('\n\n*Nota importante:* Para mayor seguridad y servicio, ayúdanos a respetar el reglamento de transporte. La persona que no cumpla con dicho reglamento será reportada a Recursos Humanos.', textAlign: TextAlign.center, style: TEXT_RULE_STYLE,),
          Text('\nReporta cualquier falta al área de Recursos Humanos.', style: TEXT_RULE_STYLE, textAlign: TextAlign.center),
          Text('\nTransporte Empresarial y Servicios Administrativos S.A. de C.V.', style: TEXT_RULE_STYLE, textAlign: TextAlign.center),
          Text('\nJuanacatlán, Jal. Malecón No.12 int 3 Centro 37 32 27 47', style: TEXT_RULE_STYLE, textAlign: TextAlign.center),
          SizedBox(height: 15,),
        ],
      ),
    );
  }

  Widget _rowText(String first, String second) => Padding(
    padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Esta es la línea clave
      children: [
        Text(
          '$first',
          style: TEXT_RULE_STYLE
        ),
        Expanded(
          child: Text(
            '$second',
            textAlign: TextAlign.justify,
            style: TEXT_RULE_STYLE,
            softWrap: true,
          ),
        ),
      ],
    ),
  );

  Widget titulo(String first) =>
      Padding(
        padding: const EdgeInsets.only(left: 15.0, bottom: 2),
        child: Text('$first',
          style: TextStyle(
              fontSize: 19.5,
              color: Colors.black,
              fontWeight: FontWeight.bold
          ), textAlign: TextAlign.center,
        ),
      );
}