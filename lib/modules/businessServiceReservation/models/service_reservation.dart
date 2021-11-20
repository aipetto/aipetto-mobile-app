import 'dart:convert';

import 'package:aipetto/modules/pet/models/pets.dart';

ServiceReservations serviceReservationsFromJson(String str) => ServiceReservations.fromJson(json.decode(str));

String serviceReservationsToJson(ServiceReservations data) => json.encode(data.toJson());

class ServiceReservations {
  ServiceReservations({
    this.rows,
  });

  List<Reservation> rows;

  factory ServiceReservations.fromJson(Map<String, dynamic> json) => ServiceReservations(
    rows: List<Reservation>.from(json["rows"].map((x) => Reservation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "rows": List<dynamic>.from(rows.map((x) => x.toJson())),
  };
}

class Reservation {
  Reservation({
    this.serviceType,
    this.serviceProviderIDs,
    this.needTransportation,
    this.id,
    this.businessId,
    this.time,
    this.date,
    this.customerTenant,
    this.tenant,
    this.totalPrice,
    this.createdBy,
    this.updatedBy,
    this.source,
    this.customerId,
    this.place,
    this.discountCode,
    this.digitalReservationDoc,
    this.pet,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.rowId,
  });


  List<ServiceType> serviceType;
  List<dynamic> serviceProviderIDs;
  bool needTransportation;
  String id;
  String businessId;
  String time;
  DateTime date;
  String customerTenant;
  String tenant;
  double totalPrice;
  String createdBy;
  String updatedBy;
  String source;
  dynamic customerId;
  dynamic place;
  dynamic discountCode;
  List<dynamic> digitalReservationDoc;
  String pet;
  String createdAt;
  String updatedAt;
  int v;
  String rowId;

  Reservation copyWith({
    serviceType,
    needTransportation,
    businessId,
    time,
    date,
    customerTenant,
    tenant,
    totalPrice,
    source,
    place,
    discountCode
  }) => Reservation(
      serviceType: serviceType ?? this.serviceType,
      needTransportation: needTransportation ?? this.needTransportation,
      businessId: businessId ?? this.businessId,
      time: time ?? this.time,
      date: date ?? this.date,
      customerTenant: customerTenant ?? this.customerTenant,
      tenant: tenant ?? this.tenant,
      totalPrice: totalPrice ?? this.totalPrice,
      source: source ?? this.source,
      place: place ?? this.place,
      discountCode: discountCode ?? this.discountCode
  );

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
    serviceType: List<ServiceType>.from(json["serviceType"].map((x) => ServiceType.fromJson(x))),
    serviceProviderIDs: List<dynamic>.from(json["serviceProviderIDs"].map((x) => x)),
    needTransportation: json["needTransportation"],
    id: json["_id"],
    businessId: json["businessId"],
    time: json["time"],
    date: DateTime.parse(json["date"]),
    customerTenant: json["customerTenant"],
    tenant: json["tenant"],
    totalPrice: json["totalPrice"] * 0.1,
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    source: json["source"],
    customerId: json["customerId"],
    place: json["place"],
    discountCode: json["discountCode"],
    digitalReservationDoc: List<dynamic>.from(json["digitalReservationDoc"].map((x) => x)),
    pet: json["pet"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
    rowId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "serviceType": List<dynamic>.from(serviceType.map((x) => x.toJson())),
    "serviceProviderIDs": List<dynamic>.from(serviceProviderIDs.map((x) => x)),
    "needTransportation": needTransportation,
    "_id": id,
    "businessId": businessId,
    "time": time,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "tenant": tenant,
    "customerTenant": customerTenant,
    "totalPrice": totalPrice,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "source": source,
    "customerId": customerId,
    "place": place,
    "discountCode": discountCode,
    "digitalReservationDoc": List<dynamic>.from(digitalReservationDoc.map((x) => x)),
    "pet": pet,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
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
    this.v
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
  String createdAt;
  String updatedAt;
  int v;

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
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
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
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "id": businessId,
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
  String updatedAt;
  String createdAt;
  String businessLogoId;

  factory BusinessLogo.fromJson(Map<String, dynamic> json) => BusinessLogo(
    id: json["_id"],
    name: json["name"],
    sizeInBytes: json["sizeInBytes"],
    publicUrl: json["publicUrl"],
    privateUrl: json["privateUrl"],
    updatedAt: json["updatedAt"],
    createdAt: json["createdAt"],
    businessLogoId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "sizeInBytes": sizeInBytes,
    "publicUrl": publicUrl,
    "privateUrl": privateUrl,
    "updatedAt": updatedAt,
    "createdAt": createdAt,
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
