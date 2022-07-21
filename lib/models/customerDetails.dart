class customerDetails {
  Id? iId;
  String? username;
  String? customername;
  String? cAddress;
  String? phoneNumber;
  String? cLocation;
  V? vV;

  customerDetails(
      {this.iId,
      this.username,
      this.customername,
      this.cAddress,
      this.phoneNumber,
      this.cLocation,
      this.vV});

  customerDetails.fromJson(Map<String, dynamic> json) {
    iId = json['_id'] != null ? new Id.fromJson(json['_id']) : null;
    username = json['username'];
    customername = json['customername'];
    cAddress = json['cAddress'];
    phoneNumber = json['phoneNumber'];
    cLocation = json['cLocation'];
    vV = json['__v'] != null ? new V.fromJson(json['__v']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.iId != null) {
      data['_id'] = this.iId!.toJson();
    }
    data['username'] = this.username;
    data['customername'] = this.customername;
    data['cAddress'] = this.cAddress;
    data['phoneNumber'] = this.phoneNumber;
    data['cLocation'] = this.cLocation;
    if (this.vV != null) {
      data['__v'] = this.vV!.toJson();
    }
    return data;
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$oid'] = this.oid;
    return data;
  }
}

class V {
  String? numberInt;

  V({this.numberInt});

  V.fromJson(Map<String, dynamic> json) {
    numberInt = json['$numberInt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$numberInt'] = this.numberInt;
    return data;
  }
}
