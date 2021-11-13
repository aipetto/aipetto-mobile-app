import 'package:equatable/equatable.dart';

import 'dart:convert';

BusinessPlace businessPlaceFromJson(String str) => BusinessPlace.fromJson(json.decode(str));

String businessPlaceToJson(BusinessPlace data) => json.encode(data.toJson());

class BusinessPlacesList {
  BusinessPlacesList({
    this.listPlaces,
  });

  List<BusinessPlace> listPlaces;

  factory BusinessPlacesList.fromJson(Map<String, dynamic> json) => BusinessPlacesList(
    listPlaces: List<BusinessPlace>.from(json["rows"].map((x) => BusinessPlace.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "rows": List<dynamic>.from(listPlaces.map((x) => x.toJson())),
  };
}

class BusinessPlace extends Equatable{
  BusinessPlace({
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
    this.longitude,
    this.latitude,
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
    this.businessPlaceId,
  });

  Location location;
  List<dynamic> services;
  List<AddressCountry> categories;
  bool is24Hours;
  bool isOpen;
  String id;
  dynamic stars;
  dynamic closeTime;
  dynamic openTime;
  String addressState;
  String addressCity;
  dynamic addressZipCode;
  String addressNumber;
  String address;
  double longitude;
  double latitude;
  dynamic placeType;
  String name;
  BusinessId businessId;
  AddressCountry addressCountry;
  String tenant;
  String createdBy;
  String updatedBy;
  List<dynamic> photoLogo;
  List<dynamic> photoStore;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String businessPlaceId;

  factory BusinessPlace.fromJson(Map<String, dynamic> json) => BusinessPlace(
    location: Location.fromJson(json["location"]),
    services: List<dynamic>.from(json["services"].map((x) => x)),
    categories: List<AddressCountry>.from(json["categories"].map((x) => AddressCountry.fromJson(x))),
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
    longitude: json["longitude"].toDouble(),
    latitude: json["latitude"].toDouble(),
    placeType: json["placeType"],
    name: json["name"],
    businessId: BusinessId.fromJson(json["businessId"]),
    addressCountry: AddressCountry.fromJson(json["addressCountry"]),
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    photoLogo: List<dynamic>.from(json["photoLogo"].map((x) => x)),
    photoStore: List<dynamic>.from(json["photoStore"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    businessPlaceId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "services": List<dynamic>.from(services.map((x) => x)),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
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
    "longitude": longitude,
    "latitude": latitude,
    "placeType": placeType,
    "name": name,
    "businessId": businessId.toJson(),
    "addressCountry": addressCountry.toJson(),
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "photoLogo": List<dynamic>.from(photoLogo.map((x) => x)),
    "photoStore": List<dynamic>.from(photoStore.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": businessPlaceId,
  };

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class AddressCountry {
  AddressCountry({
    this.id,
    this.name,
    this.initials,
    this.tenant,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.addressCountryId,
    this.pageUrl,
    this.categoryImage,
    this.language,
  });

  String id;
  String name;
  String initials;
  String tenant;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String addressCountryId;
  dynamic pageUrl;
  List<dynamic> categoryImage;
  String language;

  factory AddressCountry.fromJson(Map<String, dynamic> json) => AddressCountry(
    id: json["_id"],
    name: json["name"],
    initials: json["initials"] == null ? null : json["initials"],
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    addressCountryId: json["id"],
    pageUrl: json["pageUrl"],
    categoryImage: json["categoryImage"] == null ? null : List<dynamic>.from(json["categoryImage"].map((x) => x)),
    language: json["language"] == null ? null : json["language"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "initials": initials == null ? null : initials,
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": addressCountryId,
    "pageUrl": pageUrl,
    "categoryImage": categoryImage == null ? null : List<dynamic>.from(categoryImage.map((x) => x)),
    "language": language == null ? null : language,
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

class Location {
  Location({
    this.type,
    this.coordinates,
  });

  String type;
  List<double> coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

final staticBusinessesPlaces = [
  BusinessPlace(
    id: '610cb9c812bcbd22144e84f8',
    tenant: '61096ec884e5ebfca16f0143',
    name: 'Veterinária Bons Amigos',
    services: ['Vet, PetShop, Hotel'],
    address: 'Avenida Frei Henrique soares',
    addressNumber: '163',
    addressCity: 'Contagem',
    addressState: 'Minas Gerais',
    businessId: BusinessId(id: '610cbc1212bcbd59074e84fa'),
    addressCountry: AddressCountry(name: 'Brasil'),
    photoLogo: [{'privateUrl': 'assets/images/logos/veterinariabonsamigos.jpg'}],
    isOpen: true,
    openTime: '09:00',
    closeTime: '18:00'
  )
];

class BusinessPlaceSelected {
  BusinessPlace businessPlace;

  BusinessPlaceSelected(this.businessPlace);
}

