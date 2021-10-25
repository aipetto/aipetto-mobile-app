// To parse this JSON data, do
//
//     final reservation = reservationFromJson(jsonString);

import 'dart:convert';

Reservation reservationFromJson(String str) =>
    Reservation.fromJson(json.decode(str));

String reservationToJson(Reservation data) => json.encode(data.toJson());

class Reservation {
  Reservation({
    this.serviceType,
    this.serviceProviderIDs,
    this.needTransportation,
    this.id,
    this.totalPriceWithDiscount,
    this.totalPrice,
    this.status,
    this.place,
    this.time,
    this.customerId,
    this.businessId,
    this.date,
    this.discountCode,
    this.tenant,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.digitalReservationDoc,
    this.reservationId,
    this.source
  });

  List<ServiceType> serviceType;
  List<dynamic> serviceProviderIDs;
  bool needTransportation;
  String id;
  int totalPriceWithDiscount;
  int totalPrice;
  String status;
  Place place;
  String time;
  dynamic customerId;
  BusinessId businessId;
  DateTime date;
  dynamic discountCode;
  String tenant;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  List<dynamic> digitalReservationDoc;
  String reservationId;
  String source;

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        serviceType: List<ServiceType>.from(
            json["serviceType"].map((x) => ServiceType.fromJson(x))),
        serviceProviderIDs:
            List<dynamic>.from(json["serviceProviderIDs"].map((x) => x)),
        needTransportation: json["needTransportation"],
        id: json["_id"],
        totalPriceWithDiscount: json["totalPriceWithDiscount"],
        totalPrice: json["totalPrice"],
        status: json["status"],
        place: Place.fromJson(json["place"]),
        time: json["time"],
        customerId: json["customerId"],
        businessId: BusinessId.fromJson(json["businessId"]),
        date: DateTime.parse(json["date"]),
        discountCode: json["discountCode"],
        tenant: json["tenant"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        digitalReservationDoc:
            List<dynamic>.from(json["digitalReservationDoc"].map((x) => x)),
        reservationId: json["id"],
        source: json["source"],
      );

  Map<String, dynamic> toJson() => {
        "serviceType": List<dynamic>.from(serviceType.map((x) => x.toJson())),
        "serviceProviderIDs":
            List<dynamic>.from(serviceProviderIDs.map((x) => x)),
        "needTransportation": needTransportation,
        "_id": id,
        "totalPriceWithDiscount": totalPriceWithDiscount,
        "totalPrice": totalPrice,
        "status": status,
        "place": place.toJson(),
        "time": time,
        "customerId": customerId,
        "businessId": businessId.toJson(),
        "date": date.toIso8601String(),
        "discountCode": discountCode,
        "tenant": tenant,
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "digitalReservationDoc":
            List<dynamic>.from(digitalReservationDoc.map((x) => x)),
        "id": reservationId,
        "source": source
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
    this.v,
    this.addressPostCode,
    this.addressStreet,
    this.addressStreetNumber,
    this.businessId,
    this.contactEmail,
    this.contactName,
    this.contactPhone,
    this.contactWhatsApp,
    this.country,
    this.businessLogo,
    this.businessIdId,
  });

  List<dynamic> services;
  List<dynamic> categories;
  String id;
  String name;
  String tenant;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  dynamic addressPostCode;
  dynamic addressStreet;
  dynamic addressStreetNumber;
  String businessId;
  dynamic contactEmail;
  dynamic contactName;
  dynamic contactPhone;
  dynamic contactWhatsApp;
  String country;
  List<dynamic> businessLogo;
  String businessIdId;

  factory BusinessId.fromJson(Map<String, dynamic> json) => BusinessId(
        services: List<dynamic>.from(json["services"].map((x) => x)),
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        tenant: json["tenant"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        addressPostCode: json["addressPostCode"],
        addressStreet: json["addressStreet"],
        addressStreetNumber: json["addressStreetNumber"],
        businessId: json["businessID"],
        contactEmail: json["contactEmail"],
        contactName: json["contactName"],
        contactPhone: json["contactPhone"],
        contactWhatsApp: json["contactWhatsApp"],
        country: json["country"],
        businessLogo: List<dynamic>.from(json["businessLogo"].map((x) => x)),
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
        "__v": v,
        "addressPostCode": addressPostCode,
        "addressStreet": addressStreet,
        "addressStreetNumber": addressStreetNumber,
        "businessID": businessId,
        "contactEmail": contactEmail,
        "contactName": contactName,
        "contactPhone": contactPhone,
        "contactWhatsApp": contactWhatsApp,
        "country": country,
        "businessLogo": List<dynamic>.from(businessLogo.map((x) => x)),
        "id": businessIdId,
      };
}

class Place {
  Place({
    this.services,
    this.categories,
    this.is24Hours,
    this.isOpen,
    this.id,
    this.closeTime,
    this.openTime,
    this.addressZipCode,
    this.addressNumber,
    this.address,
    this.longitude,
    this.latitude,
    this.businessId,
    this.tenant,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.name,
    this.photoLogo,
    this.photoStore,
    this.placeId,
  });

  List<dynamic> services;
  List<dynamic> categories;
  bool is24Hours;
  bool isOpen;
  String id;
  dynamic closeTime;
  dynamic openTime;
  String addressZipCode;
  String addressNumber;
  String address;
  double longitude;
  double latitude;
  String businessId;
  String tenant;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String name;
  List<dynamic> photoLogo;
  List<dynamic> photoStore;
  String placeId;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        services: List<dynamic>.from(json["services"].map((x) => x)),
        categories: List<dynamic>.from(json["categories"].map((x) => x)),
        is24Hours: json["is24hours"],
        isOpen: json["isOpen"],
        id: json["_id"],
        closeTime: json["closeTime"],
        openTime: json["openTime"],
        addressZipCode: json["addressZipCode"],
        addressNumber: json["addressNumber"],
        address: json["address"],
        longitude: json["longitude"].toDouble(),
        latitude: json["latitude"].toDouble(),
        businessId: json["businessId"],
        tenant: json["tenant"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        name: json["name"],
        photoLogo: List<dynamic>.from(json["photoLogo"].map((x) => x)),
        photoStore: List<dynamic>.from(json["photoStore"].map((x) => x)),
        placeId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "services": List<dynamic>.from(services.map((x) => x)),
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "is24hours": is24Hours,
        "isOpen": isOpen,
        "_id": id,
        "closeTime": closeTime,
        "openTime": openTime,
        "addressZipCode": addressZipCode,
        "addressNumber": addressNumber,
        "address": address,
        "longitude": longitude,
        "latitude": latitude,
        "businessId": businessId,
        "tenant": tenant,
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "name": name,
        "photoLogo": List<dynamic>.from(photoLogo.map((x) => x)),
        "photoStore": List<dynamic>.from(photoStore.map((x) => x)),
        "id": placeId,
      };
}

class ServiceType {
  ServiceType({
    this.id,
    this.language,
    this.category,
    this.name,
    this.tenant,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.serviceImage,
    this.serviceTypeId,
  });

  String id;
  String language;
  dynamic category;
  String name;
  String tenant;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  List<dynamic> serviceImage;
  String serviceTypeId;

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
        id: json["_id"],
        language: json["language"],
        category: json["category"],
        name: json["name"],
        tenant: json["tenant"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        serviceImage: List<dynamic>.from(json["serviceImage"].map((x) => x)),
        serviceTypeId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "language": language,
        "category": category,
        "name": name,
        "tenant": tenant,
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "serviceImage": List<dynamic>.from(serviceImage.map((x) => x)),
        "id": serviceTypeId,
      };
}
