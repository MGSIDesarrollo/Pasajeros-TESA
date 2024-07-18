/*
Developed by: Vanessa Garcia - 2023
 */
class Proveedores {
  String? targetvalues;

  Proveedores({
    this.targetvalues,
  });

  /// Tranforms JSON to [Vehiculo]
  factory Proveedores.fromJSON(Map<String, dynamic> json) => Proveedores(
    targetvalues: json["targetvalues"],

  );

  /// Returns a string whit basic person info.
  @override
  String toString() {
    return 'targetvalues: $targetvalues';
  }

  Map<String, dynamic> toJSON()=>{
    'targetvalues': targetvalues,
  };

}