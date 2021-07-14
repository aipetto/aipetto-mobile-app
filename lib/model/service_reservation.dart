// To parse this JSON data, do
//
//     final serviceReservation = serviceReservationFromJson(jsonString);

import 'dart:convert';

ServiceReservation serviceReservationFromJson(String str) => ServiceReservation.fromJson(json.decode(str));

String serviceReservationToJson(ServiceReservation data) => json.encode(data.toJson());

class ServiceReservation {
  ServiceReservation({
    this.serviceType,
    this.serviceProviderIDs,
    this.needTransportation,
    this.id,
    this.status,
    this.place,
    this.time,
    this.customerId,
    this.businessId,
    this.date,
    this.tenant,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.serviceReservationId,
  });

  List<dynamic> serviceType;
  List<dynamic> serviceProviderIDs;
  bool needTransportation;
  String id;
  String status;
  dynamic place;
  String time;
  CustomerId customerId;
  BusinessId businessId;
  DateTime date;
  String tenant;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  String serviceReservationId;

  factory ServiceReservation.fromJson(Map<String, dynamic> json) => ServiceReservation(
    serviceType: List<dynamic>.from(json["serviceType"].map((x) => x)),
    serviceProviderIDs: List<dynamic>.from(json["serviceProviderIDs"].map((x) => x)),
    needTransportation: json["needTransportation"],
    id: json["_id"],
    status: json["status"],
    place: json["place"],
    time: json["time"],
    customerId: CustomerId.fromJson(json["customerId"]),
    businessId: BusinessId.fromJson(json["businessId"]),
    date: DateTime.parse(json["date"]),
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    serviceReservationId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "serviceType": List<dynamic>.from(serviceType.map((x) => x)),
    "serviceProviderIDs": List<dynamic>.from(serviceProviderIDs.map((x) => x)),
    "needTransportation": needTransportation,
    "_id": id,
    "status": status,
    "place": place,
    "time": time,
    "customerId": customerId.toJson(),
    "businessId": businessId.toJson(),
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "id": serviceReservationId,
  };
}

class BusinessId {
  BusinessId({
    this.services,
    this.categories,
    this.id,
    this.name,
    this.tenant,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.addressPostCode,
    this.addressStreet,
    this.addressStreetNumber,
    this.businessId,
    this.contactEmail,
    this.contactName,
    this.contactPhone,
    this.contactWhatsApp,
    this.country,
    this.city,
    this.state,
    this.businessIdId,
  });

  List<String> services;
  List<String> categories;
  String id;
  String name;
  String tenant;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic addressPostCode;
  dynamic addressStreet;
  dynamic addressStreetNumber;
  String businessId;
  dynamic contactEmail;
  dynamic contactName;
  dynamic contactPhone;
  dynamic contactWhatsApp;
  String country;
  dynamic city;
  dynamic state;
  String businessIdId;

  factory BusinessId.fromJson(Map<String, dynamic> json) => BusinessId(
    services: List<String>.from(json["services"].map((x) => x)),
    categories: List<String>.from(json["categories"].map((x) => x)),
    id: json["_id"],
    name: json["name"],
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    addressPostCode: json["addressPostCode"],
    addressStreet: json["addressStreet"],
    addressStreetNumber: json["addressStreetNumber"],
    businessId: json["businessID"],
    contactEmail: json["contactEmail"],
    contactName: json["contactName"],
    contactPhone: json["contactPhone"],
    contactWhatsApp: json["contactWhatsApp"],
    country: json["country"],
    city: json["city"],
    state: json["state"],
    businessIdId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "services": List<dynamic>.from(services.map((x) => x)),
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "_id": id,
    "name": name,
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "addressPostCode": addressPostCode,
    "addressStreet": addressStreet,
    "addressStreetNumber": addressStreetNumber,
    "businessID": businessId,
    "contactEmail": contactEmail,
    "contactName": contactName,
    "contactPhone": contactPhone,
    "contactWhatsApp": contactWhatsApp,
    "country": country,
    "city": city,
    "state": state,
    "id": businessIdId,
  };
}

class CustomerId {
  CustomerId({
    this.id,
    this.userId,
    this.gender,
    this.birthdate,
    this.name,
    this.tenant,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.customerIdId,
  });

  String id;
  String userId;
  String gender;
  DateTime birthdate;
  String name;
  String tenant;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  String customerIdId;

  factory CustomerId.fromJson(Map<String, dynamic> json) => CustomerId(
    id: json["_id"],
    userId: json["userId"],
    gender: json["gender"],
    birthdate: DateTime.parse(json["birthdate"]),
    name: json["name"],
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    customerIdId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "gender": gender,
    "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
    "name": name,
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "id": customerIdId,
  };
}
