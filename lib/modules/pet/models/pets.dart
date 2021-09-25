// To parse this JSON data, do
//
//     final pets = petsFromJson(jsonString);

import 'dart:convert';

Pets petsFromJson(String str) => Pets.fromJson(json.decode(str));

String petsToJson(Pets data) => json.encode(data.toJson());

class Pets {
  Pets({
    this.rows,
  });

  List<Pet> rows;

  factory Pets.fromJson(Map<String, dynamic> json) => Pets(
    rows: List<Pet>.from(json["rows"].map((x) => Pet.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "rows": List<dynamic>.from(rows.map((x) => x.toJson())),
  };
}

Pet petFromJson(String str) => Pet.fromJson(json.decode(str));

String petToJson(Pet data) => json.encode(data.toJson());

class Pet {
  Pet({
    this.petOwners,
    this.photos,
    this.vaccines,
    this.hasBeenVaccinated,
    this.hasBeenDewormed,
    this.hasBeenSterilizedSpayed,
    this.isLost,
    this.usersAuthorized,
    this.businessAuthorized,
    this.isLookingForMatch,
    this.diseases,
    this.isGuideDog,
    this.matches,
    this.petFriends,
    this.hasMicrochip,
    this.id,
    this.numberOfLikes,
    this.biography,
    this.health,
    this.furLength,
    this.maturitySize,
    this.type,
    this.breed,
    this.sex,
    this.secondColor,
    this.color,
    this.age,
    this.birthdate,
    this.profileImage,
    this.nickname,
    this.name,
    this.secondBreedMixed,
    this.customerId,
    this.tenant,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.petId,
    this.bloodType,
    this.weight
  });

  List<PetOwner> petOwners;
  List<Photo> photos;
  List<dynamic> vaccines;
  bool hasBeenVaccinated;
  bool hasBeenDewormed;
  bool hasBeenSterilizedSpayed;
  bool isLost;
  List<PetOwner> usersAuthorized;
  List<BusinessAuthorized> businessAuthorized;
  bool isLookingForMatch;
  List<dynamic> diseases;
  bool isGuideDog;
  List<Match> matches;
  List<Match> petFriends;
  bool hasMicrochip;
  String id;
  int numberOfLikes;
  String biography;
  String health;
  String furLength;
  String maturitySize;
  Breed type;
  Breed breed;
  String sex;
  String secondColor;
  String color;
  int age;
  DateTime birthdate;
  List<ProfileImage> profileImage;
  String nickname;
  String name;
  dynamic secondBreedMixed;
  dynamic customerId;
  String tenant;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String petId;
  String bloodType;
  String weight;

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
      petOwners: List<PetOwner>.from(json["petOwners"].map((x) => PetOwner.fromJson(x))),
      photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
      vaccines: List<dynamic>.from(json["vaccines"].map((x) => x)),
      hasBeenVaccinated: json["hasBeenVaccinated"],
      hasBeenDewormed: json["hasBeenDewormed"],
      hasBeenSterilizedSpayed: json["hasBeenSterilizedSpayed"],
      isLost: json["isLost"],
      usersAuthorized: List<PetOwner>.from(json["usersAuthorized"].map((x) => PetOwner.fromJson(x))),
      businessAuthorized: List<BusinessAuthorized>.from(json["businessAuthorized"].map((x) => BusinessAuthorized.fromJson(x))),
      isLookingForMatch: json["isLookingForMatch"],
      diseases: List<dynamic>.from(json["diseases"].map((x) => x)),
      isGuideDog: json["isGuideDog"],
      matches: List<Match>.from(json["matches"].map((x) => Match.fromJson(x))),
      petFriends: List<Match>.from(json["petFriends"].map((x) => Match.fromJson(x))),
      hasMicrochip: json["hasMicrochip"],
      id: json["_id"],
      //numberOfLikes: json["numberOfLikes"],
      //biography: json["biography"],
      //health: json["health"],
      //furLength: json["furLength"],
      //maturitySize: json["maturitySize"],
      //type: Breed.fromJson(json["type"]),
      //breed: Breed.fromJson(json["breed"]),
      //sex: json["sex"],
      //secondColor: json["secondColor"],
      //color: json["color"],
      age: json["age"],
      //birthdate: DateTime.parse(json["birthdate"]),
      profileImage: List<ProfileImage>.from(json["profileImage"].map((x) => ProfileImage.fromJson(x))),
      //nickname: json["nickname"],
      name: json["name"],
      //secondBreedMixed: json["secondBreedMixed"],
      //customerId: json["customerId"],
      tenant: json["tenant"],
      createdBy: json["createdBy"],
      updatedBy: json["updatedBy"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      petId: json["id"],
      //bloodType: json["bloodType"],
      //weight: json["weight"]
  );

  Map<String, dynamic> toJson() => {
    "petOwners": List<dynamic>.from(petOwners.map((x) => x.toJson())),
    "photos": List<dynamic>.from(photos.map((x) => x.toJson())),
    "vaccines": List<dynamic>.from(vaccines.map((x) => x)),
    "hasBeenVaccinated": hasBeenVaccinated,
    "hasBeenDewormed": hasBeenDewormed,
    "hasBeenSterilizedSpayed": hasBeenSterilizedSpayed,
    "isLost": isLost,
    "usersAuthorized": List<dynamic>.from(usersAuthorized.map((x) => x.toJson())),
    "businessAuthorized": List<dynamic>.from(businessAuthorized.map((x) => x.toJson())),
    "isLookingForMatch": isLookingForMatch,
    "diseases": List<dynamic>.from(diseases.map((x) => x)),
    "isGuideDog": isGuideDog,
    "matches": List<dynamic>.from(matches.map((x) => x.toJson())),
    "petFriends": List<dynamic>.from(petFriends.map((x) => x.toJson())),
    "hasMicrochip": hasMicrochip,
    "_id": id,
    "numberOfLikes": numberOfLikes,
    "biography": biography,
    "health": health,
    "furLength": furLength,
    "maturitySize": maturitySize,
    "type": type.toJson(),
    "breed": breed.toJson(),
    "sex": sex,
    "secondColor": secondColor,
    "color": color,
    "age": age,
    "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
    "profileImage": List<dynamic>.from(profileImage.map((x) => x.toJson())),
    "nickname": nickname,
    "name": name,
    "secondBreedMixed": secondBreedMixed,
    "customerId": customerId,
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": petId,
    "bloodType": bloodType,
    "weight": weight,
  };

  Pet copyWith({
    bool hasBeenVaccinated,
    bool hasBeenDewormed,
    bool hasBeenSterilizedSpayed,
    bool isLookingForMatch,
    List<dynamic> diseases,
    bool isGuideDog,
    bool hasMicrochip,
    String biography,
    String furLength,
    String maturitySize,
    Breed type,
    Breed breed,
    String sex,
    String secondColor,
    String color,
    int age,
    DateTime birthdate,
    List<ProfileImage> profileImage,
    String nickname,
    String name,
    dynamic secondBreedMixed,
    String bloodType,
  }) => Pet(
      hasBeenVaccinated: hasBeenVaccinated ?? this.hasBeenVaccinated,
      hasBeenDewormed: hasBeenDewormed ?? this.hasBeenDewormed,
      hasBeenSterilizedSpayed: hasBeenSterilizedSpayed ?? this.hasBeenSterilizedSpayed,
      isLookingForMatch: isLookingForMatch ?? this.isLookingForMatch,
      hasMicrochip: hasMicrochip ?? this.hasMicrochip,
      biography: biography ?? this.biography,
      furLength: furLength ?? this.furLength,
      maturitySize: maturitySize ?? this.maturitySize,
      type: type ?? this.type,
      breed: breed ?? this.breed,
      sex: sex ?? this.sex,
      secondColor: secondColor ?? this.secondColor,
      color: color ?? this.color,
      age: age ?? this.age,
      birthdate: birthdate ?? this.birthdate,
      profileImage: profileImage ?? this.profileImage,
      nickname: nickname ?? this.nickname,
      name: name ?? this.name,
      secondBreedMixed: secondBreedMixed ?? this.secondBreedMixed,
      bloodType: bloodType ?? this.bloodType
  );
}

class Breed {
  Breed({
    this.id,
    this.language,
    this.name,
    this.importHash,
    this.tenant,
    this.createdBy,
    this.updatedBy,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.breedId,
    this.breeds,
  });

  String id;
  String language;
  String name;
  String importHash;
  String tenant;
  String createdBy;
  String updatedBy;
  List<ProfileImage> image;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String breedId;
  List<String> breeds;

  factory Breed.fromJson(Map<String, dynamic> json) => Breed(
    id: json["_id"],
    language: json["language"],
    name: json["name"],
    importHash: json["importHash"] == null ? null : json["importHash"],
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    image: List<ProfileImage>.from(json["image"].map((x) => ProfileImage.fromJson(x))),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    breedId: json["id"],
    breeds: json["breeds"] == null ? null : List<String>.from(json["breeds"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "language": language,
    "name": name,
    "importHash": importHash == null ? null : importHash,
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "image": List<dynamic>.from(image.map((x) => x.toJson())),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": breedId,
    "breeds": breeds == null ? null : List<dynamic>.from(breeds.map((x) => x)),
  };
}

class ProfileImage {
  ProfileImage({
    this.name,
    this.sizeInBytes,
    this.publicUrl,
    this.privateUrl,
    this.createdAt,
    this.updatedAt,
    this.downloadUrl,
  });

  String name;
  int sizeInBytes;
  dynamic publicUrl;
  String privateUrl;
  DateTime createdAt;
  DateTime updatedAt;
  String downloadUrl;

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
    name: json["name"],
    sizeInBytes: json["sizeInBytes"],
    publicUrl: json["publicUrl"],
    privateUrl: json["privateUrl"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    downloadUrl: json["downloadUrl"] == null ? null : json["downloadUrl"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "sizeInBytes": sizeInBytes,
    "publicUrl": publicUrl,
    "privateUrl": privateUrl,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "downloadUrl": downloadUrl == null ? null : downloadUrl,
  };
}

class BusinessAuthorized {
  BusinessAuthorized({
    this.location,
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
    this.facebook,
    this.instagram,
    this.linkedin,
    this.notes,
    this.streetComplement,
    this.website,
    this.businessAuthorizedId,
    this.city,
    this.state,
  });

  Location location;
  List<String> services;
  List<dynamic> categories;
  String id;
  String name;
  String tenant;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String addressPostCode;
  String addressStreet;
  String addressStreetNumber;
  String businessId;
  dynamic contactEmail;
  dynamic contactName;
  dynamic contactPhone;
  dynamic contactWhatsApp;
  String country;
  List<dynamic> businessLogo;
  dynamic facebook;
  dynamic instagram;
  dynamic linkedin;
  dynamic notes;
  dynamic streetComplement;
  dynamic website;
  String businessAuthorizedId;
  dynamic city;
  dynamic state;

  factory BusinessAuthorized.fromJson(Map<String, dynamic> json) => BusinessAuthorized(
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    services: List<String>.from(json["services"].map((x) => x)),
    categories: List<dynamic>.from(json["categories"].map((x) => x)),
    id: json["_id"],
    name: json["name"],
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    addressPostCode: json["addressPostCode"] == null ? null : json["addressPostCode"],
    addressStreet: json["addressStreet"] == null ? null : json["addressStreet"],
    addressStreetNumber: json["addressStreetNumber"] == null ? null : json["addressStreetNumber"],
    businessId: json["businessID"],
    contactEmail: json["contactEmail"],
    contactName: json["contactName"],
    contactPhone: json["contactPhone"],
    contactWhatsApp: json["contactWhatsApp"],
    country: json["country"],
    businessLogo: List<dynamic>.from(json["businessLogo"].map((x) => x)),
    facebook: json["facebook"],
    instagram: json["instagram"],
    linkedin: json["linkedin"],
    notes: json["notes"],
    streetComplement: json["streetComplement"],
    website: json["website"],
    businessAuthorizedId: json["id"],
    city: json["city"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "location": location == null ? null : location.toJson(),
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
    "addressPostCode": addressPostCode == null ? null : addressPostCode,
    "addressStreet": addressStreet == null ? null : addressStreet,
    "addressStreetNumber": addressStreetNumber == null ? null : addressStreetNumber,
    "businessID": businessId,
    "contactEmail": contactEmail,
    "contactName": contactName,
    "contactPhone": contactPhone,
    "contactWhatsApp": contactWhatsApp,
    "country": country,
    "businessLogo": List<dynamic>.from(businessLogo.map((x) => x)),
    "facebook": facebook,
    "instagram": instagram,
    "linkedin": linkedin,
    "notes": notes,
    "streetComplement": streetComplement,
    "website": website,
    "id": businessAuthorizedId,
    "city": city,
    "state": state,
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

class Match {
  Match({
    this.petOwners,
    this.photos,
    this.vaccines,
    this.hasBeenVaccinated,
    this.hasBeenDewormed,
    this.hasBeenSterilizedSpayed,
    this.isLost,
    this.usersAuthorized,
    this.businessAuthorized,
    this.isLookingForMatch,
    this.diseases,
    this.isGuideDog,
    this.matches,
    this.petFriends,
    this.hasMicrochip,
    this.id,
    this.type,
    this.breed,
    this.sex,
    this.profileImage,
    this.color,
    this.age,
    this.birthdate,
    this.nickname,
    this.name,
    this.customerId,
    this.tenant,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.matchId,
  });

  List<String> petOwners;
  List<dynamic> photos;
  List<dynamic> vaccines;
  bool hasBeenVaccinated;
  bool hasBeenDewormed;
  bool hasBeenSterilizedSpayed;
  bool isLost;
  List<dynamic> usersAuthorized;
  List<dynamic> businessAuthorized;
  bool isLookingForMatch;
  List<dynamic> diseases;
  bool isGuideDog;
  List<dynamic> matches;
  List<dynamic> petFriends;
  bool hasMicrochip;
  String id;
  String type;
  String breed;
  String sex;
  List<ProfileImage> profileImage;
  String color;
  int age;
  DateTime birthdate;
  String nickname;
  String name;
  dynamic customerId;
  String tenant;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String matchId;

  factory Match.fromJson(Map<String, dynamic> json) => Match(
    petOwners: List<String>.from(json["petOwners"].map((x) => x)),
    photos: List<dynamic>.from(json["photos"].map((x) => x)),
    vaccines: List<dynamic>.from(json["vaccines"].map((x) => x)),
    hasBeenVaccinated: json["hasBeenVaccinated"],
    hasBeenDewormed: json["hasBeenDewormed"],
    hasBeenSterilizedSpayed: json["hasBeenSterilizedSpayed"],
    isLost: json["isLost"],
    usersAuthorized: List<dynamic>.from(json["usersAuthorized"].map((x) => x)),
    businessAuthorized: List<dynamic>.from(json["businessAuthorized"].map((x) => x)),
    isLookingForMatch: json["isLookingForMatch"],
    diseases: List<dynamic>.from(json["diseases"].map((x) => x)),
    isGuideDog: json["isGuideDog"],
    matches: List<dynamic>.from(json["matches"].map((x) => x)),
    petFriends: List<dynamic>.from(json["petFriends"].map((x) => x)),
    hasMicrochip: json["hasMicrochip"],
    id: json["_id"],
    type: json["type"],
    breed: json["breed"] == null ? null : json["breed"],
    sex: json["sex"],
    profileImage: List<ProfileImage>.from(json["profileImage"].map((x) => ProfileImage.fromJson(x))),
    color: json["color"] == null ? null : json["color"],
    age: json["age"],
    birthdate: DateTime.parse(json["birthdate"]),
    nickname: json["nickname"] == null ? null : json["nickname"],
    name: json["name"],
    customerId: json["customerId"],
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    matchId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "petOwners": List<dynamic>.from(petOwners.map((x) => x)),
    "photos": List<dynamic>.from(photos.map((x) => x)),
    "vaccines": List<dynamic>.from(vaccines.map((x) => x)),
    "hasBeenVaccinated": hasBeenVaccinated,
    "hasBeenDewormed": hasBeenDewormed,
    "hasBeenSterilizedSpayed": hasBeenSterilizedSpayed,
    "isLost": isLost,
    "usersAuthorized": List<dynamic>.from(usersAuthorized.map((x) => x)),
    "businessAuthorized": List<dynamic>.from(businessAuthorized.map((x) => x)),
    "isLookingForMatch": isLookingForMatch,
    "diseases": List<dynamic>.from(diseases.map((x) => x)),
    "isGuideDog": isGuideDog,
    "matches": List<dynamic>.from(matches.map((x) => x)),
    "petFriends": List<dynamic>.from(petFriends.map((x) => x)),
    "hasMicrochip": hasMicrochip,
    "_id": id,
    "type": type,
    "breed": breed == null ? null : breed,
    "sex": sex,
    "profileImage": List<dynamic>.from(profileImage.map((x) => x.toJson())),
    "color": color == null ? null : color,
    "age": age,
    "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
    "nickname": nickname == null ? null : nickname,
    "name": name,
    "customerId": customerId,
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": matchId,
  };
}

class PetOwner {
  PetOwner({
    this.id,
    this.petOwnerId,
    this.firstName,
    this.lastName,
    this.email,
  });

  String id;
  String petOwnerId;
  String firstName;
  String lastName;
  String email;

  factory PetOwner.fromJson(Map<String, dynamic> json) => PetOwner(
    id: json["_id"],
    petOwnerId: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "id": petOwnerId,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
  };
}

class Photo {
  Photo({
    this.id,
    this.longitude,
    this.latitude,
    this.photo,
    this.petId,
    this.description,
    this.tenant,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.photoId,
  });

  String id;
  String longitude;
  String latitude;
  List<ProfileImage> photo;
  String petId;
  String description;
  String tenant;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String photoId;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    id: json["_id"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    photo: List<ProfileImage>.from(json["photo"].map((x) => ProfileImage.fromJson(x))),
    petId: json["petId"],
    description: json["description"],
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    photoId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "longitude": longitude,
    "latitude": latitude,
    "photo": List<dynamic>.from(photo.map((x) => x.toJson())),
    "petId": petId,
    "description": description,
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": photoId,
  };
}

class PetSelected{
  final Pet pet;

  PetSelected(this.pet);
}

// TODO Remove hardcode and consume from API
final veterinarians = [
  Pet(
    nickname: 'Supet Pet',
  ),
];