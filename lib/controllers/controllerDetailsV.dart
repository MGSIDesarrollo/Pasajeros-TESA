/*
Developed by: Vanessa Garcia - 2023
 */
class ViajeD {
  String? viajesid;
  String? viaje_id;
  String? nombre_ruta;
  String? fecha;
  String? hora_prev;
  String? vehiculo_id;
  String? ruta_id;
  String? cliente;
  String? comentario;
  String? centro;
  String? horario_inicio;
  String? horario_final;
  String? kil_ini;
  String? kil_fin;
  String? vehiculosid;
  String? idcliente;
  String? tipo;
  String? trabajadas;
  String? distancia;
  String? tipo_viaje;

  ViajeD({
    this.viajesid,
    this.viaje_id,
    this.nombre_ruta,
    this.fecha,
    this.hora_prev,
    this.vehiculo_id,
    this.ruta_id,
    this.cliente,
    this.comentario,
    this.centro,
    this.horario_inicio,
    this.horario_final,
    this.kil_ini,
    this.kil_fin,
    this.vehiculosid,
    this.idcliente,
    this.tipo,
    this.trabajadas,
    this.distancia,
    this.tipo_viaje,
  });

  /// Tranforms JSON to [ViajeD]
  factory ViajeD.fromJSON(Map<String, dynamic> json) => ViajeD(
    viajesid: json["viajesid"],
    viaje_id: json["viaje_id"],
    nombre_ruta: json["nombre_ruta"],
    fecha: json["fecha"],
    hora_prev: json["hora_prev"],
    vehiculo_id: json["vehiculo_id"],
    ruta_id: json["ruta_id"],
    cliente: json["cliente"],
    comentario: json["comentario"],
    centro: json["centro"],
    horario_inicio: json["horario_inicio"],
    horario_final: json["horario_final"],
    kil_ini: json["kil_ini"],
    kil_fin: json["kil_fin"],
    vehiculosid: json["vehiculosid"],
    idcliente: json["idcliente"],
    tipo: json["tipo"],
    trabajadas: json["trabajadas"],
    distancia: json["distancia"],
    tipo_viaje: json["tipo_viaje"],
  );

  /// Returns a string whit basic person info.
  @override
  String toString() {
    return 'idcliente: $idcliente, vehiculosid $vehiculosid, viajesid: $viajesid, viaje_id: $viaje_id, nombre_ruta: $nombre_ruta, fecha: $fecha, hora_prev: $hora_prev, vehiculo_id: $vehiculo_id, ruta_id: $ruta_id, cliente: $cliente, centro: $centro, comentario: $comentario, horario_inicio: $horario_inicio, horario_final: $horario_final, kil_ini: $kil_ini, kil_fin: $kil_fin, tipo $tipo, trabajadas $trabajadas, distancia $distancia, tipo_viaje $tipo_viaje';
  }

  Map<String, dynamic> toJSON()=>{
    'viajesid': viajesid,
    'viaje_id': viaje_id,
    'nombre_ruta': nombre_ruta,
    'fecha': fecha,
    'hora_prev': hora_prev,
    'vehiculo_id': vehiculo_id,
    'ruta_id': ruta_id,
    'cliente':cliente,
    'centro': centro,
    'comentario': comentario,
    'horario_inicio' : horario_inicio,
    'horario_final': horario_final,
    'kil_ini': kil_ini,
    'kil_fin': kil_fin,
    'vehiculosid' : vehiculosid,
    'idcliente': idcliente,
    'tipo': tipo,
    'trabajadas': trabajadas,
    'distancia': distancia,
    'tipo_viaje': tipo_viaje,
  };
}
