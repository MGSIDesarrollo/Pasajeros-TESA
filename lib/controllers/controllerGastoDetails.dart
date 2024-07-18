/*
Developed by: Vanessa Garcia - 2023
 */
class GastoD {
  String? gastosid;
  String? gasto_id;
  String? concepto;
  String? tipo_pago;
  String? costo;
  String? proveedor;
  String? litros;
  String? precio_litro;
  String? kilometraje;
  String? comentario;
  String? fecha_gasto;
  String? km_ini;
  String? rendimiento;
  String? recorrido;
  String? hora;
  String? pxk;
  String? vehiculo_id;
  String? folio;



  GastoD({
    this.gastosid,
    this.gasto_id,
    this.concepto,
    this.tipo_pago,
    this.costo,
    this.proveedor,
    this.litros,
    this.precio_litro,
    this.kilometraje,
    this.comentario,
    this.fecha_gasto,
    this.km_ini,
    this.rendimiento,
    this.recorrido,
    this.hora,
    this.pxk,
    this.vehiculo_id,
    this.folio,

  });

  /// Tranforms JSON to [GastoD]
  factory GastoD.fromJSON(Map<String, dynamic> json) => GastoD(
    gastosid: json["gastosid"],
    gasto_id: json["gasto_id"],
    concepto: json["concepto"],
    tipo_pago: json["tipo_pago"],
    costo: json["costo"],
    proveedor: json["proveedor"],
    litros: json["litros"],
    precio_litro: json["precio_litro"],
    kilometraje: json["kilometraje"],
    comentario: json["comentario"],
    fecha_gasto: json["fecha_gasto"],
    km_ini: json["km_ini"],
    rendimiento: json["rendimiento"],
    recorrido: json["recorrido"],
    hora: json["hora"],
    pxk: json["pxk"],
    vehiculo_id: json["vehiculo_id"],
    folio: json["folio"],

  );

  /// Returns a string whit basic person info.
  @override
  String toString() {
    return 'gastosid: $gastosid, gasto_id: $gasto_id, concepto: $concepto, tipo_pago: $tipo_pago, costo: $costo, proveedor: $proveedor, litros: $litros, precio_litro: $precio_litro, kilometraje: $kilometraje, comentario: $comentario, fecha_gasto: $fecha_gasto, km_ini: $km_ini, rendimiento: $rendimiento, recorrido: $recorrido, hora: $hora, pxk: $pxk, vehiculo_id: $vehiculo_id, folio: $folio';
  }

  Map<String, dynamic> toJSON()=>{
    'gastosid': gastosid,
    'gasto_id': gasto_id,
    'concepto': concepto,
    'tipo_pago': tipo_pago,
    'costo': costo,
    'proveedor': proveedor,
    'litros': litros,
    'precio_litro':precio_litro,
    'kilometraje': kilometraje,
    'comentario': comentario,
    'fecha_gasto' : fecha_gasto,
    'km_ini': km_ini,
    'rendimiento': rendimiento,
    'recorrido': recorrido,
    'hora' : hora,
    'pxk': pxk,
    'vehiculo_id': vehiculo_id,
    'folio':folio
  };
}
