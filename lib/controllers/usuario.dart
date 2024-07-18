class Usuario {
  String? crmid;
  String? nombres;
  String? apellidos;
  String? empresa;
  String? estatus;
  String? codigo;

  Usuario({
    required this.crmid,
    required this.nombres,
    required this.apellidos,
    required this.empresa,
    required this.estatus,
    required this.codigo,
  });

  /// Tranforms JSON to [Usuario]
  Usuario.fromJSON (Map jsonData) {
    crmid = jsonData['crmid'] ?? '';
    nombres = jsonData['nombres'] ?? '';
    apellidos = jsonData['apellidos'] ?? '';
    empresa = jsonData['empresa'] ?? '';
    estatus = jsonData['estatus'] ?? '';
    codigo = jsonData['codigo'] ?? '';
  }

  @override
  String toString() {
    return 'crmid: $crmid, nombres: $nombres, apellidos: $apellidos, empresa: $empresa, estatus: $estatus, codigo: $codigo';
  }

  Map<String, dynamic> toJSON()=>{
   // return {
      'crmid': crmid,
      'nombres': nombres,
      'apellidos': apellidos,
      'empresa': empresa,
      'estatus': estatus,
      'codigo': codigo,
    };
  //}

}