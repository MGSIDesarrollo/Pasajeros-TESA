import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper.internal();
  factory DatabaseHelper() => instance;

  static Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  Future<Database> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'rola.db');

    // Abre la base de datos (crea una nueva si no existe)
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Crea las tablas en la base de datos
        await db.execute(
          'CREATE TABLE Clientes('
              'accountid TEXT, '
              'account_no TEXT, '
              'accountname TEXT'
          ')',
        );
        await db.execute(
          'CREATE TABLE Gastos('
              'gastosid TEXT,'
              'gasto_id TEXT,'
              'concepto TEXT,'
              'costo TEXT,'
              'proveedor TEXT,'
              'litros TEXT,'
              'fecha_gasto TEXT,'
              'vehiculo_id TEXT'
          ')',
        );
        await db.execute('''
        CREATE TABLE GastosDetalles (
          gastosid TEXT, 
          gasto_id TEXT, 
          concepto TEXT, 
          tipo_pago TEXT,
          costo TEXT,
          proveedor TEXT,
          litros TEXT,
          precio_litro TEXT,
          kilometraje TEXT,
          comentario TEXT,
          fecha_gasto TEXT,
          km_ini TEXT,
          rendimiento TEXT,
          recorrido TEXT,
          hora TEXT,
          pxk TEXT,
          vehiculo_id TEXT,
          folio TEXT
          )''');
        await db.execute('''
        CREATE TABLE Users (
          crmid TEXT, 
          nombres TEXT, 
          apellidos TEXT,
          empresa TEXT,
          estatus TEXT,
          codigo TEXT
          )''');
        await db.execute('''
        CREATE TABLE Proveedores (
          targetvalues TEXT
          )''');
        await db.execute('''
        CREATE TABLE Rutas (
          costorutaid TEXT, 
          estado TEXT, 
          desc_ruta TEXT,
          tipo TEXT, 
          costo TEXT, 
          comison TEXT,
          ruta_id TEXT,
          cliente TEXT,
          tipov TEXT
          )''');
        await db.execute('''
        CREATE TABLE Viaje (
          viajesid TEXT, 
          viaje_id TEXT, 
          fecha TEXT,
          hora_prev TEXT,
          vehiculo_id TEXT,
          ruta_id TEXT,
          accountname TEXT
          )''');
        await db.execute('''
        CREATE TABLE ViajesDetalles (
          viajesid TEXT, 
          viaje_id TEXT, 
          nombre_ruta TEXT, 
          fecha TEXT,
          hora_prev TEXT,
          vehiculo_id TEXT,
          ruta_id TEXT,
          cliente TEXT,
          comentario TEXT,
          centro TEXT,
          horario_inicio TEXT,
          horario_final TEXT,
          kil_ini TEXT,
          kil_fin TEXT,
          vehiculosid TEXT,
          idcliente TEXT,
          tipo TEXT
          )''');
        await db.execute('''
        CREATE TABLE Autos (
          crmid TEXT, 
          id TEXT, 
          nombre TEXT, 
          id_propietario TEXT, 
          nombre_propietario TEXT, 
          codigo_tipo TEXT, 
          tipo TEXT, 
          marca TEXT, 
          modelo TEXT, 
          num_serie TEXT, 
          num_motor TEXT, 
          poliza TEXT, 
          com_poliza TEXT, 
          vigencia TEXT, 
          placas_est TEXT, 
          placas_fed TEXT, 
          kilometraje TEXT
          )''');
        await db.execute('''
        CREATE TABLE AutoSeleccionado (
          id TEXT, 
          crmid TEXT, 
          nombre TEXT, 
          id_propietario TEXT, 
          nombre_propietario TEXT, 
          codigo_tipo TEXT, 
          tipo TEXT, 
          marca TEXT, 
          modelo TEXT, 
          num_serie TEXT, 
          num_motor TEXT, 
          poliza TEXT, 
          com_poliza TEXT, 
          vigencia TEXT, 
          placas_est TEXT, 
          placas_fed TEXT, 
          kilometraje TEXT
          )''');
      },
    );
  }
}
