import 'package:flutter/material.dart';
import 'package:pasajeros/funciones/request.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../conexion/urls.dart';
import '../controllers/usuario.dart';
import '../funciones/colores.dart';
import '../funciones/loopAnimation.dart';
import '../funciones/widgets.dart';

class Ruta extends StatefulWidget {
  final Usuario info;
  Ruta({Key? key, required this.info}) : super(key: key);

  @override
  _RutaState createState() => _RutaState();
}

class _RutaState extends State<Ruta> with SingleTickerProviderStateMixin{

  var controller;
  String? ruta = null;
  late MyLoopAnimation _loopAnimation;

  @override
  void initState() {
    super.initState();
    _loopAnimation = MyLoopAnimation(this);
    getRuta();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: LIGHT,
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
          backgroundColor: DARK_BLUE_COLOR,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ruta == null ? Center(child: progressWidget(_loopAnimation, MediaQuery.of(context).size.width)) : html(),
        )
    );
  }

  Widget html(){
    controller = WebViewController()..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFFFFFFFF))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
        ),
      )..loadRequest(Uri.parse('https://www.google.com/maps/d/u/0/viewer?mid=1IbhGuaAwm35yri4r9hd03aZsLbCMgIgt&ll=20.773818985333563%2C-103.43335326515302&z=13'));
    return WebViewWidget(controller: controller);
  }

  void getRuta() {
    getUrlMap(widget.info.crmid).then((value) {
      setState(() {
        ruta = value;
      });
    });
  }
}


