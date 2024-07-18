/*
Developed by: Vanessa Garcia - 2022
 */
class Rutas {
  String? costorutaid;
  String? estado;
  String? desc_ruta;
  String? tipo;
  String? costo;
  String? comison;
  String? ruta_id;
  String? cliente;
  String? tipov;

  Rutas({
    this.costorutaid,
    this.estado,
    this.desc_ruta,
    this.tipo,
    this.costo,
    this.comison,
    this.ruta_id,
    this.cliente,
    this.tipov,
  });

  /// Tranforms JSON to [Rutas]
  factory Rutas.fromJSON(Map<String, dynamic> json) => Rutas(
    costorutaid: json["costorutaid"],
    estado: json["estado"],
    desc_ruta: json["desc_ruta"],
    tipo: json["tipo"],
    costo: json["costo"],
    comison: json["comison"],
      ruta_id: json['ruta_id'],
      cliente: json["cliente"],
      tipov: json['tipov']
  );

  /// Returns a string whit basic person info.
  @override
  String toString() {
    return 'costorutaid: $costorutaid, estado: $estado, desc_ruta: $desc_ruta, tipo: $tipo, costo: $costo, comison: $comison, ruta_id: $ruta_id, cliente: $cliente, tipov: $tipov';
  }

  Map<String, dynamic> toJSON()=>{
    'costorutaid': costorutaid,
    'estado': estado,
    'desc_ruta': desc_ruta,
    'tipo': tipo,
    'costo': costo,
    'comison': comison,
    'ruta_id': ruta_id,
    'cliente': cliente,
    'tipov': tipov,
  };

}