import 'dart:convert';

import 'package:aipetto/modules/businessPlace/models/business_place.dart';

ServiceAvailability serviceAvailabilityFromJson(String str) => ServiceAvailability.fromJson(json.decode(str));

String serviceAvailabilityToJson(ServiceAvailability data) => json.encode(data.toJson());

class ServiceAvailabilities {
  ServiceAvailabilities({
    this.rows,
  });

  List<ServiceAvailability> rows;

  factory ServiceAvailabilities.fromJson(Map<String, dynamic> json) => ServiceAvailabilities(
    rows: List<ServiceAvailability>.from(json["rows"].map((x) => ServiceAvailability.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "rows": List<dynamic>.from(rows.map((x) => x.toJson())),
  };
}

class ServiceAvailability {
  ServiceAvailability({
    this.timeSlot,
    this.days,
    this.workOnHolidays,
    this.places,
    this.id,
    this.serviceType,
    this.businessId,
    this.name,
    this.tenant,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.rowId,
  });

  List<String> timeSlot;
  List<String> days;
  bool workOnHolidays;
  List<BusinessPlace> places;
  String id;
  ServiceType serviceType;
  BusinessId businessId;
  dynamic name;
  String tenant;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String rowId;

  factory ServiceAvailability.fromJson(Map<String, dynamic> json) => ServiceAvailability(
    timeSlot: List<String>.from(json["timeSlot"].map((x) => x)),
    days: List<String>.from(json["days"].map((x) => x)),
    workOnHolidays: json["workOnHolidays"],
    places: List<BusinessPlace>.from(json["places"].map((x) => BusinessPlace.fromJson(x))),
    id: json["_id"],
    serviceType: ServiceType.fromJson(json["serviceType"]),
    businessId: BusinessId.fromJson(json["businessId"]),
    name: json["name"],
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    rowId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "timeSlot": List<dynamic>.from(timeSlot.map((x) => x)),
    "days": List<dynamic>.from(days.map((x) => x)),
    "workOnHolidays": workOnHolidays,
    "places": List<dynamic>.from(places.map((x) => x.toJson())),
    "_id": id,
    "serviceType": serviceType.toJson(),
    "businessId": businessId.toJson(),
    "name": name,
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
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

  List<dynamic> services;
  List<String> categories;
  String id;
  dynamic instagram;
  dynamic notes;
  dynamic linkedin;
  String facebook;
  dynamic website;
  String longitude;
  String latitude;
  List<BusinessLogo> businessLogo;
  dynamic addressPostCode;
  dynamic streetComplement;
  dynamic addressStreetNumber;
  dynamic addressStreet;
  dynamic contactEmail;
  dynamic contactWhatsApp;
  dynamic contactPhone;
  String contactName;
  String name;
  String businessId;
  dynamic city;
  String state;
  String country;
  String language;
  String currency;
  String tenant;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String businessIdId;

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
    "services": List<dynamic>.from(services.map((x) => x)),
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "_id": id,
    "instagram": instagram,
    "notes": notes,
    "linkedin": linkedin,
    "facebook": facebook,
    "website": website,
    "longitude": longitude,
    "latitude": latitude,
    "businessLogo": List<dynamic>.from(businessLogo.map((x) => x.toJson())),
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
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
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

  String id;
  String name;
  int sizeInBytes;
  dynamic publicUrl;
  String privateUrl;
  DateTime updatedAt;
  DateTime createdAt;
  String businessLogoId;

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
    "updatedAt": updatedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "id": businessLogoId,
  };
}

class ServiceType {
  ServiceType({
    this.id,
    this.serviceImage,
    this.language,
    this.category,
    this.name,
    this.tenant,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.serviceTypeId,
  });

  String id;
  List<BusinessLogo> serviceImage;
  String language;
  String category;
  String name;
  String tenant;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String serviceTypeId;

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
    id: json["_id"],
    serviceImage: List<BusinessLogo>.from(json["serviceImage"].map((x) => BusinessLogo.fromJson(x))),
    language: json["language"],
    category: json["category"],
    name: json["name"],
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    serviceTypeId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "serviceImage": List<dynamic>.from(serviceImage.map((x) => x.toJson())),
    "language": language,
    "category": category,
    "name": name,
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": serviceTypeId,
  };
}
