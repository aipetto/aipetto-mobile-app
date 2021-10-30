import 'package:equatable/equatable.dart';

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
    this.placeId,
  });

  Location location;
  List<dynamic> services;
  List<String> categories;
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
  String businessId;
  String addressCountry;
  String tenant;
  String createdBy;
  String updatedBy;
  List<dynamic> photoLogo;
  List<dynamic> photoStore;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String placeId;

  factory BusinessPlace.fromJson(Map<String, dynamic> json) => BusinessPlace(
    location: Location.fromJson(json["location"]),
    services: List<dynamic>.from(json["services"].map((x) => x)),
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
    longitude: json["longitude"].toDouble(),
    latitude: json["latitude"].toDouble(),
    placeType: json["placeType"],
    name: json["name"],
    businessId: json["businessId"],
    addressCountry: json["addressCountry"],
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    photoLogo: List<dynamic>.from(json["photoLogo"].map((x) => x)),
    photoStore: List<dynamic>.from(json["photoStore"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    placeId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "services": List<dynamic>.from(services.map((x) => x)),
    "categories": List<dynamic>.from(categories.map((x) => x)),
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
    "businessId": businessId,
    "addressCountry": addressCountry,
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "photoLogo": List<dynamic>.from(photoLogo.map((x) => x)),
    "photoStore": List<dynamic>.from(photoStore.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": placeId,
  };

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Place: {id: $id}';
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
