import 'package:flutter/material.dart';

///THEME COLORS
const Color MAIN_COLOR = Color(0xFFEE622D);
const Color SECONDARY_COLOR = Color(0xFFF38B44);
const Color LIGHT_SECONDARY_COLOR = Color(0xFFFFA769);
const Color ULTRA_LIGHT_SECONDARY_COLOR = Color(0xFFFDEBDF);
const Color DARK_BLUE_COLOR = Color(0xFF15295E);
const Color LIGHT_BLUE_COLOR = Color(0xFF386EFF);
const Color ULTRA_LIGHT_BLUE_GHOST_COLOR = Color.fromARGB(150, 150, 200, 255);
const Color LIGHT_BLUE_GHOST_COLOR = Color.fromARGB(150, 56, 110, 255);
const Color DARK_BLUE_GHOST_COLOR = Color.fromARGB(180, 40, 50, 100);
const Color inteco = Color(0xFF538FBF);
const Color ALERTA = Color(0xFFE3F2FD);
const Color LIGHT = Color(0xFFFFFFFF);
const Color GREY_COLOR = Color(0xFF7A7E7F);
const Color GREY_COLOR2 = Color(0xFF61615f);
const Color DARK = Color(0xFF000000);
const Color WARNING = Color(0xFFFFBF3F);

///OTHER COLORS
const Color NO_UPDATE = Colors.black26;
const Color UPDATE = Colors.cyan;
const Color ACTIVE = Colors.green;
const Color NOT_EXISTS = Colors.redAccent;
const Color ARROW_COLOR = Color(0xFFC7EFCF);
const Color pabs = Color(0xFF01579B);
const Color ERROR_COLOR = Color(0xFF15A4ED);
///TEXT STYLES
const TextStyle DANGER_TEXT_STYLE = TextStyle(color: Colors.red);
const TextStyle DARK_TEXT_STYLE = TextStyle(color: DARK_BLUE_COLOR);
const TextStyle TEXT_BUTTON_STYLE = TextStyle(color: Colors.white);
const TextStyle TEXT_INPUT_STYLE = TextStyle(color: Colors.blue);
const TextStyle TEXT_CARD_STYLE = TextStyle(color: MAIN_COLOR);
const TextStyle TEXT_LABEL_STYLE = TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: DARK_BLUE_COLOR);
const TextStyle TEXT_TITLE_STYLE = TextStyle(height: 2.0, fontSize: 20.0);
const TextStyle TEXT_SUBTITLE_ERROR_STYLE = TextStyle(color: ULTRA_LIGHT_SECONDARY_COLOR, fontSize: 20.0);
const TextStyle TEXT_XXXLARGE = TextStyle(fontSize: 22.0);
const TextStyle TEXT_XXLARGE = TextStyle(fontSize: 20.0);
const TextStyle TEXT_XLARGE = TextStyle(fontSize: 18.0);
const TextStyle TEXT_LARGE = TextStyle(fontSize: 16.0);
const TextStyle TEXT_MEDIUM = TextStyle(fontSize: 14.0);
const TextStyle TEXT_SMALL = TextStyle(fontSize: 12.0);
const TextStyle TEXT_MINI = TextStyle(fontSize: 10.0);
const TextStyle TEXT_LARGE_BOLD = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
const TextStyle TEXT_MEDIUM_BOLD = TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold);
const TextStyle TEXT_SMALL_BOLD = TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold);
const TextStyle TEXT_MINI_BOLD = TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold);
const TextStyle TEXT_RULE_STYLE = TextStyle(fontSize: 15.5, color: Colors.black, fontWeight: FontWeight.bold,);

ButtonStyle DARK_BUTTON_STYLE = ElevatedButton.styleFrom(backgroundColor: DARK_BLUE_COLOR);

BoxDecoration DECORATION_BLUE_GRADIENT = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  border: Border(left: BorderSide(color: ULTRA_LIGHT_BLUE_GHOST_COLOR, width: 1), right: BorderSide(color: ULTRA_LIGHT_BLUE_GHOST_COLOR, width: 1), top: BorderSide(color: ULTRA_LIGHT_BLUE_GHOST_COLOR, width: 1)),
  boxShadow: [
    BoxShadow(
      color: DARK_BLUE_GHOST_COLOR, // Color de la sombra
      spreadRadius: 0, // Radio de expansión de la sombra
      blurRadius: 0, // Radio de desenfoque de la sombra
      offset: Offset(0, 1), // Desplazamiento de la sombra (0 para la horizontal, 4 para la vertical)
    ),
  ],
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      LIGHT,
      ULTRA_LIGHT_BLUE_GHOST_COLOR,
    ],
  ),
);

