/*
Developed by: Vanessa Garcia - 2023
 */
class Viaje {
  String? viajesid;
  String? viaje_id;
  String? fecha;
  String? hora_prev;
  String? vehiculo_id;
  String? ruta_id;
  String? accountname;

  Viaje({
    this.viajesid,
    this.viaje_id,
    this.fecha,
    this.hora_prev,
    this.vehiculo_id,
    this.ruta_id,
    this.accountname,
  });

/// Tranforms JSON to [Viaje]
  factory Viaje.fromJSON(Map<String, dynamic> json) => Viaje(
    viajesid: json["viajesid"],
    viaje_id: json["viaje_id"],
    fecha: json["fecha"],
    hora_prev: json["hora_prev"],
    vehiculo_id: json["vehiculo_id"],
    ruta_id: json["ruta_id"],
    accountname: json["accountname"],
  );

  /// Returns a string whit basic person info.
  @override
  String toString() {
    return 'viajesid: $viajesid, viaje_id: $viaje_id, fecha: $fecha, hora_prev: $hora_prev, vehiculo_id: $vehiculo_id, ruta_id: $ruta_id, accountname: $accountname';
  }

  Map<String, dynamic> toJSON()=>{
    'viajesid': viajesid,
    'viaje_id': viaje_id,
    'fecha': fecha,
    'hora_prev': hora_prev,
    'vehiculo_id': vehiculo_id,
    'ruta_id': ruta_id,
    'accountname':accountname,
  };
}