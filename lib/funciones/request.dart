import 'dart:convert';
import 'package:http/http.dart' as http;
import '../conexion/urls.dart';
import '../controllers/usuario.dart';

//login request
Future<Usuario?> loginReq(String usr, String pass) async {

  var url = PRE_URL + '/login.php';

  var response = await http.post(Uri.parse(url), body:{
    'user': usr,
    'pass': pass
  });

  if(response.statusCode != 200){
    print('too imbecil');
    return null;
  }

  var data;

  try{
    data = jsonDecode(response.body);
    print('Reteseponse '+data['data'].toString());
  }catch(e){
    print('catche '+e.toString());
    return null;
  }

  if(data['status']==200 && data['data']!=null){
    print('Retesponse '+data['data'].toString());
    return Usuario.fromJSON(data['data']);
    //return data['data'];
  }
  print('fin we');
  return null;
}

///Login with persistence
Future<Usuario?> loadSessionReq( String hash ) async {

  var url = PRE_URL + '/load-session.php';
  var response = await http.post(Uri.parse(url), body: {
    'hash-key': hash,
  });

  if (response.statusCode!=200) {
    return null;
  }
  var data;

  try {
    data = jsonDecode(response.body);
  } catch (e) {
    return null;
  }

  if(data['status']==200 && data['data']!=null){
    return Usuario.fromJSON(data['data']);
  }

  return null;
}

/// Save token and hash.
Future<bool?> saveTokenReq( String fcmToken, String hash, String id ) async {
  var url = PRE_URL + '/hash-token-save.php';

  var response = await http.post(Uri.parse(url), body: {
    'token': fcmToken,
    'hash': hash,
    'id': id
  });

  if (response.statusCode!=200) {
    return null;
  }
  var data;

  try {
    data = jsonDecode(response.body);
  } catch (e) {
    return null;
  }

  return data['status']==200;

}

Future getQRCode(id) async {

  var url = PRE_URL + '/getCode.php';

  var response = await http.post(Uri.parse(url),body: {
    'id_pasajero': id,
  });
  var data = jsonDecode(response.body);
  if(data['status'] == 200){

    return data['image'];
  }

  return null;
}

Future getUrlMap(id) async {

  var url = PRE_URL + '/getRuta.php';

  var response = await http.post(Uri.parse(url),body: {
    'id_pasajero': id,
  });
  var data = jsonDecode(response.body);
  print(data.toString());
  if(data['status'] == 200){
    return data['data'];
  }

  return 'Sin ruta';
}