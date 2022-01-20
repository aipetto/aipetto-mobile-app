// To parse this JSON data, do
//
//     final petType = petTypeFromJson(jsonString);

import 'dart:convert';

PetType petTypeFromJson(String str) => PetType.fromJson(json.decode(str));

String petTypeToJson(PetType data) => json.encode(data.toJson());

class PetType {
  PetType({
    required this.rows,
  });

  List<Row> rows;

  factory PetType.fromJson(Map<String, dynamic> json) => PetType(
        rows: List<Row>.from(json["rows"].map((x) => Row.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rows": List<dynamic>.from(rows.map((x) => x.toJson())),
      };
}

class Row {
  Row({
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
    this.rowId,
    this.active,
  });

  String? id;
  Row? language;
  List<Image>? image;
  String? name;
  String? tenant;
  String? createdBy;
  String? updatedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? rowId;
  bool? active;

  factory Row.fromJson(Map<String, dynamic> json) => Row(
        id: json["_id"],
        language:
            json["language"] == null ? null : Row.fromJson(json["language"]),
        image: json["image"] == null
            ? null
            : List<Image>.from(json["image"].map((x) => Image.fromJson(x))),
        name: json["name"],
        tenant: json["tenant"],
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        rowId: json["id"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "language": language == null ? null : language!.toJson(),
        "image": image == null
            ? null
            : List<dynamic>.from(image!.map((x) => x.toJson())),
        "name": name,
        "tenant": tenant,
        "createdBy": createdBy,
        "updatedBy": updatedBy,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "id": rowId,
        "active": active == null ? null : active,
      };
}

class Image {
  Image({
    this.id,
    this.name,
    this.sizeInBytes,
    this.publicUrl,
    this.privateUrl,
    this.createdAt,
    this.updatedAt,
    this.imageId,
    required this.downloadUrl,
  });

  String? id;
  String? name;
  int? sizeInBytes;
  dynamic publicUrl;
  String? privateUrl;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? imageId;
  String downloadUrl;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["_id"],
        name: json["name"],
        sizeInBytes: json["sizeInBytes"],
        publicUrl: json["publicUrl"],
        privateUrl: json["privateUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        imageId: json["id"],
        downloadUrl: json["downloadUrl"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "sizeInBytes": sizeInBytes,
        "publicUrl": publicUrl,
        "privateUrl": privateUrl,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "id": imageId,
        "downloadUrl": downloadUrl,
      };

  @override
  List<dynamic> get props => [id, name];

  @override
  String toString() => 'PetType{ id: $id}';
}

class PetTypeSelected {
  final String? id;
  final String? name;

  PetTypeSelected(this.id, this.name);
}
