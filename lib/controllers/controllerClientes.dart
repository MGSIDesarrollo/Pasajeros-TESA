/*
Developed by: Vanessa Garcia - 2022
 */
class Clientes {
  String? accountid;
  String? account_no;
  String? accountname;

  Clientes({
    this.accountid,
    this.account_no,
    this.accountname,
  });

  /// Tranforms JSON to [Clientes]
  factory Clientes.fromJSON(Map<String, dynamic> json) => Clientes(
    accountid: json["accountid"],
    account_no: json["account_no"],
    accountname: json["accountname"],
  );

  /// Returns a string whit basic person info.
  @override
  String toString() {
    return 'accountid: $accountid, account_no: $account_no, accountname: $accountname';
  }

  Map<String, dynamic> toJSON()=>{
    'accountid': accountid,
    'account_no': account_no,
    'accountname': accountname,
  };

}