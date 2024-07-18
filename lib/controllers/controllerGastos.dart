/*
Developed by: Vanessa Garcia - 2023
 */
class Gastos {
  String? gastosid;
  String? gasto_id;
  String? concepto;
  String? costo;
  String? proveedor;
  String? litros;
  String? fecha_gasto;
  String? vehiculo_id;


  Gastos({
    this.gastosid,
    this.gasto_id,
    this.concepto,
    this.costo,
    this.proveedor,
    this.litros,
    this.fecha_gasto,
    this.vehiculo_id,
  });

  /// Tranforms JSON to [Viaje]
  factory Gastos.fromJSON(Map<String, dynamic> json) => Gastos(
    gastosid: json["gastosid"],
    gasto_id: json["gasto_id"],
    concepto: json["concepto"],
    costo: json["costo"],
    proveedor: json["proveedor"],
    litros: json["litros"],
    fecha_gasto: json["fecha_gasto"],
    vehiculo_id: json["vehiculo_id"],
  );

  /// Returns a string whit basic person info.
  @override
  String toString() {
    return 'gastosid: $gastosid, gasto_id: $gasto_id, concepto: $concepto, proveedor: $proveedor, vehiculo_id: $vehiculo_id, fecha_gasto: $fecha_gasto, litros: $litros';
  }

  Map<String, dynamic> toJSON()=>{
    'gastosid': gastosid,
    'gasto_id': gasto_id,
    'concepto': concepto,
    'costo': costo,
    'proveedor': proveedor,
    'litros':litros,
    'fecha_gasto':fecha_gasto,
    'vehiculo_id': vehiculo_id,

  };
}