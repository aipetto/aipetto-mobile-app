// To parse this JSON data, do
//
//     final petType = petTypeFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

PetType petTypeFromJson(String str) => PetType.fromJson(json.decode(str));

String petTypeToJson(PetType data) => json.encode(data.toJson());

class PetType extends Equatable{
  PetType({
    this.id,
    this.language,
    this.image,
    this.name,
    this.tenant,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.petTypeId,
    this.active,
  });

  String id;
  PetType language;
  List<dynamic> image;
  String name;
  String tenant;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String petTypeId;
  bool active;

  factory PetType.fromJson(Map<String, dynamic> json) => PetType(
    id: json["_id"],
    language: json["language"] == null ? null : PetType.fromJson(json["language"]),
    image: json["image"] == null ? null : List<dynamic>.from(json["image"].map((x) => x)),
    name: json["name"],
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    petTypeId: json["id"],
    active: json["active"] == null ? null : json["active"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "language": language == null ? null : language.toJson(),
    "image": image == null ? null : List<dynamic>.from(image.map((x) => x)),
    "name": name,
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": petTypeId,
    "active": active == null ? null : active,
  };

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
