// To parse this JSON data, do
//
//     final serviceAvailabilities = serviceAvailabilitiesFromJson(jsonString);

import 'dart:convert';

ServiceAvailabilities serviceAvailabilitiesFromJson(String str) => ServiceAvailabilities.fromJson(json.decode(str));

String serviceAvailabilitiesToJson(ServiceAvailabilities data) => json.encode(data.toJson());

class ServiceAvailabilities {
  ServiceAvailabilities({
    this.rows,
    this.count,
  });

  List<ServiceAvailability>? rows;
  int? count;

  factory ServiceAvailabilities.fromJson(Map<String, dynamic> json) => ServiceAvailabilities(
    rows: List<ServiceAvailability>.from(json["rows"].map((x) => ServiceAvailability.fromJson(x))),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rows": List<dynamic>.from(rows!.map((x) => x.toJson())),
    "count": count,
  };
}

class ServiceAvailability {
  ServiceAvailability({
    this.places,
    this.timeSlot,
    this.id,
    this.serviceType,
    this.dateEnd,
    this.dateStart,
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

  List<Place>? places;
  List<String>? timeSlot;
  String? id;
  ServiceType? serviceType;
  DateTime? dateEnd;
  DateTime? dateStart;
  BusinessId? businessId;
  dynamic name;
  String? tenant;
  String? createdBy;
  String? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? rowId;

  factory ServiceAvailability.fromJson(Map<String, dynamic> json) => ServiceAvailability(
    places: List<Place>.from(json["places"].map((x) => Place.fromJson(x))),
    timeSlot: List<String>.from(json["timeSlot"].map((x) => x)),
    id: json["_id"],
    serviceType: ServiceType.fromJson(json["serviceType"]),
    dateEnd: DateTime.parse(json["dateEnd"]),
    dateStart: DateTime.parse(json["dateStart"]),
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
    "places": List<dynamic>.from(places!.map((x) => x.toJson())),
    "timeSlot": List<dynamic>.from(timeSlot!.map((x) => x)),
    "_id": id,
    "serviceType": serviceType?.toJson(),
    "dateEnd": "${dateEnd?.year.toString().padLeft(4, '0')}-${dateEnd?.month.toString().padLeft(2, '0')}-${dateEnd?.day.toString().padLeft(2, '0')}",
    "dateStart": "${dateStart?.year.toString().padLeft(4, '0')}-${dateStart?.month.toString().padLeft(2, '0')}-${dateStart?.day.toString().padLeft(2, '0')}",
    "businessId": businessId?.toJson(),
    "name": name,
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
  String? notes;
  dynamic linkedin;
  String? facebook;
  dynamic website;
  List<BusinessLogo>? businessLogo;
  dynamic addressPostCode;
  dynamic streetComplement;
  dynamic addressStreetNumber;
  dynamic addressStreet;
  dynamic contactEmail;
  String? contactWhatsApp;
  String? contactPhone;
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

class Place {
  Place({
    this.location,
    this.services,
    this.categories,
    this.is24Hours,
    this.isOpen,
    this.id,
    this.stars,
    this.closeTime,
    this.openTime,
    this.addressState,
    this.addressCity,
    this.addressZipCode,
    this.addressNumber,
    this.address,
    this.placeType,
    this.name,
    this.businessId,
    this.addressCountry,
    this.tenant,
    this.createdBy,
    this.updatedBy,
    this.photoLogo,
    this.photoStore,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.placeId,
  });

  Location? location;
  List<String>? services;
  List<String>? categories;
  bool? is24Hours;
  bool? isOpen;
  String? id;
  dynamic stars;
  String? closeTime;
  String? openTime;
  String? addressState;
  String? addressCity;
  dynamic addressZipCode;
  String? addressNumber;
  String? address;
  String? placeType;
  String? name;
  String? businessId;
  String? addressCountry;
  String? tenant;
  String? createdBy;
  String? updatedBy;
  List<BusinessLogo>? photoLogo;
  List<dynamic>? photoStore;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? placeId;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
    location: Location.fromJson(json["location"]),
    services: List<String>.from(json["services"].map((x) => x)),
    categories: List<String>.from(json["categories"].map((x) => x)),
    is24Hours: json["is24hours"],
    isOpen: json["isOpen"],
    id: json["_id"],
    stars: json["stars"],
    closeTime: json["closeTime"],
    openTime: json["openTime"],
    addressState: json["addressState"],
    addressCity: json["addressCity"],
    addressZipCode: json["addressZipCode"],
    addressNumber: json["addressNumber"],
    address: json["address"],
    placeType: json["placeType"],
    name: json["name"],
    businessId: json["businessId"],
    addressCountry: json["addressCountry"],
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    photoLogo: List<BusinessLogo>.from(json["photoLogo"].map((x) => BusinessLogo.fromJson(x))),
    photoStore: List<dynamic>.from(json["photoStore"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    placeId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "location": location?.toJson(),
    "services": List<dynamic>.from(services!.map((x) => x)),
    "categories": List<dynamic>.from(categories!.map((x) => x)),
    "is24hours": is24Hours,
    "isOpen": isOpen,
    "_id": id,
    "stars": stars,
    "closeTime": closeTime,
    "openTime": openTime,
    "addressState": addressState,
    "addressCity": addressCity,
    "addressZipCode": addressZipCode,
    "addressNumber": addressNumber,
    "address": address,
    "placeType": placeType,
    "name": name,
    "businessId": businessId,
    "addressCountry": addressCountry,
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "photoLogo": List<dynamic>.from(photoLogo!.map((x) => x.toJson())),
    "photoStore": List<dynamic>.from(photoStore!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": placeId,
  };
}

class Location {
  Location({
    this.type,
    this.coordinates,
  });

  String? type;
  List<double>? coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates!.map((x) => x)),
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

  String? id;
  List<BusinessLogo>? serviceImage;
  String? language;
  String? category;
  String? name;
  String? tenant;
  String? createdBy;
  String? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? serviceTypeId;

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
    "serviceImage": List<dynamic>.from(serviceImage!.map((x) => x.toJson())),
    "language": language,
    "category": category,
    "name": name,
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": serviceTypeId,
  };
}

class ServiceAvailabilityTimeSlotSelected {
  String? serviceAvailabilityTimeSlotSelected;

  ServiceAvailabilityTimeSlotSelected({this.serviceAvailabilityTimeSlotSelected});
}
