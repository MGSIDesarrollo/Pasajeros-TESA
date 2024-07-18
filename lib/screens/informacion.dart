import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pasajeros/funciones/request.dart';
import 'package:path_provider/path_provider.dart';

import '../conexion/urls.dart';
import '../controllers/usuario.dart';
import '../funciones/colores.dart';
import '../funciones/loopAnimation.dart';
import '../funciones/widgets.dart';

class Codigo extends StatefulWidget {
  final Usuario info;
  Codigo({Key? key, required this.info}) : super(key: key);

  @override
  _CodigoState createState() => _CodigoState();
}
class _CodigoState extends State<Codigo> with SingleTickerProviderStateMixin{

  var imageBytes = null;
  late MyLoopAnimation _loopAnimation;

  @override
  void initState() {
    super.initState();
    _loopAnimation = MyLoopAnimation(this);
    getCode();
    print('Info pas '+widget.info.toString());
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
        body: _body(),
    );
  }

  Widget _body(){
    return imageBytes == null ? Center(child: progressWidget(_loopAnimation, MediaQuery.of(context).size.width)) :
    Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(style: TEXT_TITLE_STYLE, 'Hola, '+widget.info.nombres.toString()+ ' '+widget.info.apellidos.toString()),
      _viewQR(),
    ],);
  }

  Widget _viewQR() {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))
      ),
      contentPadding: EdgeInsets.only(top: 0),
      content: Container(
        height: MediaQuery.of(context).size.height * .40,
        width: MediaQuery.of(context).size.width * .15,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text('Código QR', style: TextStyle(fontSize: 25)),
            ),
            Divider(
              height: 5,
              color: Colors.grey,
            ),
            if (imageBytes != null)
              Expanded(child:
                Container(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Image.memory(
                    imageBytes!,
                    fit: BoxFit.cover, // O elige BoxFit.contain o BoxFit.fill
                  ),
                )
              ),
            SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }

  getCode(){
    localCode().then((value) {
      if(!value){
        getQRCode(widget.info.crmid).then((value) {
          String base64Image = value;
          setState(() {
            imageBytes = base64Decode(base64Image);
          });
          saveImageFromBase64(base64Image);
        });
      }
    });
  }

  Future<bool> localCode() async{
    final directory = await getApplicationDocumentsDirectory();
    var file = File('${directory.path}/qr.jpg');
    file.exists().then((value) {
      file.readAsBytes().then((image) {
        setState(() {
          imageBytes = image;
        });
      });
    });
    if (imageBytes != null)
      return true;
    return false;
  }

  Future<String?> saveImageFromBase64(String base64Image) async {
    // Get the application documents directory
    final directory = await getApplicationDocumentsDirectory();

    // Create a unique filename (you can customize this)
    final fileName = 'qr.jpg';
    final filePath = '${directory.path}/$fileName';

    // Decode Base64 string to bytes
    final imageBytes = base64Decode(base64Image);

    // Create and write the file
    try {
      final file = File(filePath);
      await file.writeAsBytes(imageBytes);
      return filePath; // Return the saved file path
    } catch (e) {
      print('Error saving image: $e');
      return null; // Return null on error
    }
  }
}