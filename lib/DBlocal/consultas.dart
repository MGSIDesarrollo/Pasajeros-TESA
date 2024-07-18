import '../controllers/controllerGastoDetails.dart';
import '../controllers/controllerGastos.dart';
import '../controllers/controllerClientes.dart';
import '../controllers/controllerDetailsV.dart';
import '../controllers/controllerProveedores.dart';
import '../controllers/controllerRutas.dart';
import '../controllers/controllerVehiculos.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../controllers/usuario.dart';
import 'database.dart';

class Controllerconsulta {

  final conection = DatabaseHelper.instance;

  //llenar la taba de users al logearse con conexion
  Future<int> addDataLogin(Usuario usuario) async {
    var _db = await conection.db;
    int result = 0;
    try {
      result = await _db.insert('Users', usuario.toJSON());
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  //traernos los datos del usuario sin conexion
  Future<Usuario?> queryDataLogin() async {
    var _db = await conection.db;
    try {
      final queryResult = await _db.query('Users', limit: 1);
      return queryResult.isNotEmpty ? Usuario.fromJSON(queryResult.first) : null;

    } catch (error) {
      print(error.toString());
    }
  }

  Future<Vehiculo?> queryVehiculoSel() async {
    var _db = await conection.db;
    try {
      final queryResult = await _db.query('AutoSeleccionado', limit: 1);
      return queryResult.isNotEmpty ? Vehiculo.fromJSON(queryResult.first) : null;
    } catch (error) {
      print(error.toString());
    }
  }



  Future<int> delDataTravel(String id_viaje) async {
    var _db = await conection.db;
    int result =0;
    try {
      result = await _db.delete('Viaje', where: 'viaje_id = ?', whereArgs: [id_viaje]);
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  //consultar si ya existe un viaje
  Future <int> queryCountTravel(String id) async {
    var _db = await conection.db;
    int result = 0;
    try {
      result = Sqflite.firstIntValue(await _db.rawQuery('SELECT COUNT(*) FROM Viaje where viajesid = $id'))!;
    } catch (error) {
      print(error.toString());
    }
    return result;
  }

  //traernos los datos de las tareas
  Future queryDataTravel() async {
    String fechaHoy = DateFormat('dd-MM-yyyy').format(DateTime.now());
    String fechaAyer = DateFormat('dd-MM-yyyy').format(DateTime.now().add(Duration(days: -1)));
    var _db = await conection.db;
    List viajeList = [];
    try {
      String consulta = 'SELECT * FROM Viaje WHERE fecha = "$fechaHoy" OR fecha = "$fechaAyer" ORDER BY viajesid DESC';
      print("Realizando la consulta: $consulta"); // Imprime la consulta antes de ejecutarla.

      List<Map<String, dynamic>> maps = await _db.rawQuery(consulta);

      print("Resultados de la consulta: $maps"); // Imprime el resultado.

      for (var item in maps) {
        viajeList.add(item);
      }
    } catch (e) {
      print(e.toString());
    }
    return viajeList;
  }

  //traernos los detalles de los viajes
  Future<int> queryDataTravelID() async {
    var _db = await conection.db;
    int travelList = 0;
    // try {
     travelList = Sqflite.firstIntValue(await _db.rawQuery("SELECT viajesid FROM Viaje order by viajesid DESC")) ?? 0;
    //return travelList.isNotEmpty ? travelList.map((e) => Viaje.fromJSON(e)).toList() : null;

     return travelList;
  }

  Future<int> deleteDataTravel(String id) async {
    var _db = await conection.db;
    int result =0;
    try {
      result = await _db.delete('Viaje',
          where: 'viajesid=? and viaje_id=?', whereArgs: [id, 'local']);
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future<int> deleteDataTravelFIN(String id) async {
    var _db = await conection.db;
    int result =0;
    try {
      result = await _db.delete('Viaje',
          where: 'viajesid=?', whereArgs: [id]);
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  /////////////////////////////// DETALLES VIAJES //////////////////////////////

  //llenar la tabla de detalles de viajes para verlos sin conexion
  Future<int> addDataDetails(ViajeD detalles) async {
    var _db = await conection.db;
    int result = 0;
    try {
      result = await _db.insert('ViajesDetalles', detalles.toJSON());
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  //traernos los detalles de los viajes
  Future<List<ViajeD>?> queryDataDetails(id) async {
    var _db = await conection.db;

    final travelList = await _db.rawQuery("SELECT * FROM ViajesDetalles where viajesid = $id");
    return travelList.isNotEmpty ? travelList.map((e) => ViajeD.fromJSON(e)).toList() : null;
    /*for (var item in maps) {
        travelList.add(item);
      }
    } catch (e) {
      print(e.toString());
    }*/
   // return travelList;
  }

  //Actualizar los status de las tareas
  Future<int> updateDataTravel(ViajeD detalles) async {
    var _db = await conection.db;
    int result = 0;
    try {
      result = await _db.update('ViajesDetalles', detalles.toJSON(),
          where: 'viajesid=?', whereArgs: [detalles.viajesid]);
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future<int> deleteDataDetailsTravel(String id) async {
    var _db = await conection.db;
    int result =0;
    try {
      result = await _db.delete('ViajesDetalles',
          where: 'viajesid=? and viaje_id=?', whereArgs: [id, 'local']);
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future<int> deleteDataDetailsTravelFIN(String id) async {
    var _db = await conection.db;
    int result =0;
    try {
      result = await _db.delete('ViajesDetalles',
          where: 'viajesid=?', whereArgs: [id]);
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  /////////////////////////////////// AUTOS ////////////////////////////////////
  //llenar la tabla de detalles de vehiculos para traerlos sin conexion
  Future<int> addDataVehiculos(Vehiculo vehiculo) async {
    var _db = await conection.db;
    int result = 0;
    try {
      result = await _db.insert('Autos', vehiculo.toJSON());
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  Future<int> addVehiculoSel(Vehiculo vehiculo, String contactid) async {
    var _db = await conection.db;
    int result = 0;
    try {
      await _db.delete('AutoSeleccionado');
      result = await _db.insert('AutoSeleccionado', vehiculo.toJSON());
      _db.update('Users', {'vehiculo': vehiculo.crmid},
          where: 'contactid=?', whereArgs: [contactid]);
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  //consultar si ya existe un vehiculo
  Future <int> queryCountVehiculos(String id) async {
    var _db = await conection.db;
    int result = 0;
    try {
      result = Sqflite.firstIntValue(await _db.rawQuery('SELECT COUNT(*) FROM Autos where crmid = $id'))!;
    } catch (error) {
      print(error.toString());
    }
    return result;
  }

  //traernos los datos de las tareas
  Future queryDataVehiculos() async {
    var _db = await conection.db;
    List autosList = [];
    try {
      List<Map<String, dynamic>> maps = await _db.query('Autos', orderBy: 'crmid DESC');
      for (var item in maps) {
        autosList.add(item);
      }
    } catch (e) {
      print(e.toString());
    }
    return autosList;
  }

  //////////////////////////////////CLIENTES////////////////////////////////////
  //llenar la tabla de clientes para traerlos sin conexion
  Future<int> addDataClientes(Clientes clientes) async {
    var _db = await conection.db;
    int result = 0;
    try {
      result = await _db.insert('Clientes', clientes.toJSON());
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  //consultar si ya existe un cliente
  Future <int> queryCountClientes(String id) async {
    var _db = await conection.db;
    int result = 0;
    try {
      result = Sqflite.firstIntValue(await _db.rawQuery('SELECT COUNT(*) FROM Clientes where accountid = $id'))!;
    } catch (error) {
      print(error.toString());
    }
    return result;
  }

  //traernos los datos de los clientes
  Future queryDataClientes() async {
    var _db = await conection.db;
    List cientesList = [];
    try {
      List<Map<String, dynamic>> maps = await _db.query('Clientes');
      for (var item in maps) {
        cientesList.add(item);
      }
    } catch (e) {
      print(e.toString());
    }
    return cientesList;
  }

  ///////////////////////////////////RUTAS//////////////////////////////////////
//llenar la tabla de rutas para traerlos sin conexion
  Future<int> addDataRutas(Rutas rutas) async {
    var _db = await conection.db;
    int result = 0;
    try {
      result = await _db.insert('Rutas', rutas.toJSON());
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  //consultar si ya existe una rutas
  Future <int> queryCountRutas(String id) async {
    var _db = await conection.db;
    int result = 0;
    try {
      result = Sqflite.firstIntValue(await _db.rawQuery('SELECT COUNT(*) FROM Rutas where costorutaid = $id'))!;
    } catch (error) {
      print(error.toString());
    }
    return result;
  }

  //traernos los datos de las rutas
  Future queryDataRutas() async {
    var _db = await conection.db;
    List rutasList = [];
    try {
      List<Map<String, dynamic>> maps = await _db.query('Rutas', orderBy: 'costorutaid DESC');
      for (var item in maps) {
        rutasList.add(item);
      }
    } catch (e) {
      print(e.toString());
    }
    return rutasList;
  }
///////////////////////////////////GASTOS///////////////////////////////////////
  //llenar la tabla de gastos para verlos sin conexion
  Future<int> addDataGastos(Gastos gastos) async {
    var _db = await conection.db;
    int result =0;
    try {
      result = await _db.insert('Gastos', gastos.toJSON());
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  //consultar si ya existe un gastos
  Future <int> queryCountGastos(String id) async {
    var _db = await conection.db;
    int result = 0;
    try {
      result = Sqflite.firstIntValue(await _db.rawQuery('SELECT COUNT(*) FROM Gastos where gastosid = $id'))!;
    } catch (error) {
      print(error.toString());
    }
    return result;
  }

  //traernos los datos de los gastos
  Future queryDataGastos() async {
    var _db = await conection.db;
    List gastosList = [];
    try {
      List<Map<String, dynamic>> maps = await _db.query('Gastos', orderBy: 'gastosid DESC');
      for (var item in maps) {
        gastosList.add(item);
      }
    } catch (e) {
      print(e.toString());
    }
    return gastosList;
  }

  //traernos el ultimo id de los gastos de la base de datos
  Future<int> queryDataGastosID() async {
    var _db = await conection.db;
    int gastosList = 0;
    // try {
    gastosList = Sqflite.firstIntValue(await _db.rawQuery("SELECT gastosid FROM Gastos order by gastosid DESC"))!;
    //return travelList.isNotEmpty ? travelList.map((e) => Viaje.fromJSON(e)).toList() : null;

    return gastosList;
  }

  Future<int> deleteDataGastos(String id) async {
    var _db = await conection.db;
    int result =0;
    try {
      result = await _db.delete('Gastos',
          where: 'gastosid=?', whereArgs: [id]);
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  /////////////////////////////// DETALLES GASTOS //////////////////////////////

  //llenar la tabla de detalles de viajes para verlos sin conexion
  Future<int> addDataGastosDetails(GastoD gastosd) async {
    var _db = await conection.db;
    int result = 0;
    try {
      result = await _db.insert('GastosDetalles', gastosd.toJSON());
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  //traernos los detalles de los viajes
  Future<List<GastoD>?> queryDataGastosDetails(id) async {
    var _db = await conection.db;
    final travelList = await _db.rawQuery("SELECT * FROM GastosDetalles where gastosid = $id");
    return travelList.isNotEmpty ? travelList.map((e) => GastoD.fromJSON(e)).toList() : null;
    /*for (var item in maps) {
        travelList.add(item);
      }
    } catch (e) {
      print(e.toString());
    }*/
    // return travelList;
  }

  Future<int> deleteDataGastosDetails(String id) async {
    var _db = await conection.db;
    int result = 0;
    try {
      result = await _db.delete('GastosDetalles',
          where: 'gastosid=?', whereArgs: [id]);
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  //////////////////////////////// PROVEEDORES /////////////////////////////////
  //llenar la tabla de detalles de proveedores para traerlos sin conexion
  Future<int> addDataProveedores(Proveedores proveedores) async {
    var _db = await conection.db;
    int result = 0;
    try {
      result = await _db.insert('Proveedores', proveedores.toJSON());
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  //consultar si ya existe un proveedores
  Future <int> queryCountProveedores() async {
    var _db = await conection.db;
    int result = 0;
    try {
      result = Sqflite.firstIntValue(await _db.rawQuery('SELECT COUNT(*) FROM Proveedores'))!;
    } catch (error) {
      print(error.toString());
    }
    return result;
  }

  //traernos los datos de las proveedores
  Future queryDataProveedores() async {
    var _db = await conection.db;
    List proveeList = [];
    try {
      List<Map<String, dynamic>> maps = await _db.query('Proveedores');
      for (var item in maps) {
        proveeList.add(item);
      }
    } catch (e) {
      print(e.toString());
    }
    return proveeList;
  }



}