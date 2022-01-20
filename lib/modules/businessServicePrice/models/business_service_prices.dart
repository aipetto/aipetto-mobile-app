import 'dart:convert';

import 'package:equatable/equatable.dart';

// To parse this JSON data, do
//
//     final businessServicePrices = businessServicePricesFromJson(jsonString);

import 'dart:convert';

BusinessServicePrices businessServicePricesFromJson(String str) => BusinessServicePrices.fromJson(json.decode(str));

String businessServicePricesToJson(BusinessServicePrices data) => json.encode(data.toJson());

class BusinessServicePrices extends Equatable{
  BusinessServicePrices({
    this.rows,
    this.count,
  });

  final List<BusinessServicePrice>? rows;
  final int? count;

  factory BusinessServicePrices.fromJson(Map<String, dynamic> json) => BusinessServicePrices(
    rows: List<BusinessServicePrice>.from(json["rows"].map((x) => BusinessServicePrice.fromJson(x))),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rows": List<dynamic>.from(rows!.map((x) => x.toJson())),
    "count": count,
  };

  @override
  List<Object> get props => [rows as Object];
}

class BusinessServicePrice {
  BusinessServicePrice({
    this.isFree,
    this.id,
    this.currency,
    this.servicePrice,
    this.businessId,
    this.service,
    this.tenant,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.rowId,
  });

  bool? isFree;
  String? id;
  Currency? currency;
  double? servicePrice;
  BusinessId? businessId;
  Currency? service;
  String? tenant;
  String? createdBy;
  String? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? rowId;

  factory BusinessServicePrice.fromJson(Map<String, dynamic> json) => BusinessServicePrice(
    isFree: json["isFree"],
    id: json["_id"],
    currency: Currency.fromJson(json["currency"]),
    servicePrice: json["servicePrice"] + .00,
    businessId: BusinessId.fromJson(json["businessId"]),
    service: Currency.fromJson(json["service"]),
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    rowId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "isFree": isFree,
    "_id": id,
    "currency": currency?.toJson(),
    "servicePrice": servicePrice,
    "businessId": businessId?.toJson(),
    "service": service?.toJson(),
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": rowId,
  };
}

class BusinessId {
  BusinessId({
    this.services,
    this.categories,
    this.id,
    this.instagram,
    this.notes,
    this.linkedin,
    this.facebook,
    this.website,
    this.longitude,
    this.latitude,
    this.businessLogo,
    this.addressPostCode,
    this.streetComplement,
    this.addressStreetNumber,
    this.addressStreet,
    this.contactEmail,
    this.contactWhatsApp,
    this.contactPhone,
    this.contactName,
    this.name,
    this.businessId,
    this.city,
    this.state,
    this.country,
    this.language,
    this.currency,
    this.tenant,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.businessIdId,
  });

  List<dynamic>? services;
  List<String>? categories;
  String? id;
  dynamic instagram;
  dynamic notes;
  dynamic linkedin;
  String? facebook;
  dynamic website;
  String? longitude;
  String? latitude;
  List<BusinessLogo>? businessLogo;
  dynamic addressPostCode;
  dynamic streetComplement;
  dynamic addressStreetNumber;
  dynamic addressStreet;
  dynamic contactEmail;
  dynamic contactWhatsApp;
  dynamic contactPhone;
  String? contactName;
  String? name;
  String? businessId;
  dynamic city;
  String? state;
  String? country;
  String? language;
  String? currency;
  String? tenant;
  String? createdBy;
  String? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? businessIdId;

  factory BusinessId.fromJson(Map<String, dynamic> json) => BusinessId(
    services: List<dynamic>.from(json["services"].map((x) => x)),
    categories: List<String>.from(json["categories"].map((x) => x)),
    id: json["_id"],
    instagram: json["instagram"],
    notes: json["notes"],
    linkedin: json["linkedin"],
    facebook: json["facebook"],
    website: json["website"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    businessLogo: List<BusinessLogo>.from(json["businessLogo"].map((x) => BusinessLogo.fromJson(x))),
    addressPostCode: json["addressPostCode"],
    streetComplement: json["streetComplement"],
    addressStreetNumber: json["addressStreetNumber"],
    addressStreet: json["addressStreet"],
    contactEmail: json["contactEmail"],
    contactWhatsApp: json["contactWhatsApp"],
    contactPhone: json["contactPhone"],
    contactName: json["contactName"],
    name: json["name"],
    businessId: json["businessID"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    language: json["language"],
    currency: json["currency"],
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    businessIdId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "services": List<dynamic>.from(services!.map((x) => x)),
    "categories": List<dynamic>.from(categories!.map((x) => x)),
    "_id": id,
    "instagram": instagram,
    "notes": notes,
    "linkedin": linkedin,
    "facebook": facebook,
    "website": website,
    "longitude": longitude,
    "latitude": latitude,
    "businessLogo": List<dynamic>.from(businessLogo!.map((x) => x.toJson())),
    "addressPostCode": addressPostCode,
    "streetComplement": streetComplement,
    "addressStreetNumber": addressStreetNumber,
    "addressStreet": addressStreet,
    "contactEmail": contactEmail,
    "contactWhatsApp": contactWhatsApp,
    "contactPhone": contactPhone,
    "contactName": contactName,
    "name": name,
    "businessID": businessId,
    "city": city,
    "state": state,
    "country": country,
    "language": language,
    "currency": currency,
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": businessIdId,
  };
}

class BusinessLogo {
  BusinessLogo({
    this.id,
    this.name,
    this.sizeInBytes,
    this.publicUrl,
    this.privateUrl,
    this.updatedAt,
    this.createdAt,
    this.businessLogoId,
  });

  String? id;
  String? name;
  int? sizeInBytes;
  dynamic publicUrl;
  String? privateUrl;
  DateTime? updatedAt;
  DateTime? createdAt;
  String? businessLogoId;

  factory BusinessLogo.fromJson(Map<String, dynamic> json) => BusinessLogo(
    id: json["_id"],
    name: json["name"],
    sizeInBytes: json["sizeInBytes"],
    publicUrl: json["publicUrl"],
    privateUrl: json["privateUrl"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
    businessLogoId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "sizeInBytes": sizeInBytes,
    "publicUrl": publicUrl,
    "privateUrl": privateUrl,
    "updatedAt": updatedAt?.toIso8601String(),
    "createdAt": createdAt?.toIso8601String(),
    "id": businessLogoId,
  };
}

class Currency {
  Currency({
    this.active,
    this.id,
    this.name,
    this.symbol,
    this.tenant,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.currencyId,
    this.serviceImage,
    this.language,
    this.category,
  });

  bool? active;
  String? id;
  String? name;
  String? symbol;
  String? tenant;
  String? createdBy;
  String? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? currencyId;
  List<BusinessLogo>? serviceImage;
  String? language;
  String? category;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    active: json["active"] == null ? null : json["active"],
    id: json["_id"],
    name: json["name"],
    symbol: json["symbol"] == null ? null : json["symbol"],
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    currencyId: json["id"],
    serviceImage: json["serviceImage"] == null ? null : List<BusinessLogo>.from(json["serviceImage"].map((x) => BusinessLogo.fromJson(x))),
    language: json["language"] == null ? null : json["language"],
    category: json["category"] == null ? null : json["category"],
  );

  Map<String, dynamic> toJson() => {
    "active": active == null ? null : active,
    "_id": id,
    "name": name,
    "symbol": symbol == null ? null : symbol,
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": currencyId,
    "serviceImage": serviceImage == null ? null : List<dynamic>.from(serviceImage!.map((x) => x.toJson())),
    "language": language == null ? null : language,
    "category": category == null ? null : category,
  };
}
