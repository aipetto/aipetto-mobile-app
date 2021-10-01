// To parse this JSON data, do
//
//     final businessServiceType = businessServiceTypeFromJson(jsonString);

import 'dart:convert';

BusinessServiceType businessServiceTypeFromJson(String str) => BusinessServiceType.fromJson(json.decode(str));

String businessServiceTypeToJson(BusinessServiceType data) => json.encode(data.toJson());

class BusinessServiceType {
  BusinessServiceType({
    this.rows,
  });

  List<Row> rows;

  factory BusinessServiceType.fromJson(Map<String, dynamic> json) => BusinessServiceType(
    rows: List<Row>.from(json["rows"].map((x) => Row.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "rows": List<dynamic>.from(rows.map((x) => x.toJson())),
  };
}

class Row {
  Row({
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
    this.rowId,
  });

  String id;
  List<ServiceImage> serviceImage;
  Category language;
  Category category;
  String name;
  String tenant;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;
  int v;
  String rowId;

  factory Row.fromJson(Map<String, dynamic> json) => Row(
    id: json["_id"],
    serviceImage: List<ServiceImage>.from(json["serviceImage"].map((x) => ServiceImage.fromJson(x))),
    language: Category.fromJson(json["language"]),
    category: Category.fromJson(json["category"]),
    name: json["name"],
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
    rowId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "serviceImage": List<dynamic>.from(serviceImage.map((x) => x.toJson())),
    "language": language.toJson(),
    "category": category.toJson(),
    "name": name,
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "id": rowId,
  };
}

class Category {
  Category({
    this.id,
    this.pageUrl,
    this.categoryImage,
    this.language,
    this.name,
    this.tenant,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.categoryId,
    this.active,
  });

  String id;
  dynamic pageUrl;
  List<dynamic> categoryImage;
  String language;
  String name;
  String tenant;
  String createdBy;
  String updatedBy;
  String createdAt;
  String updatedAt;
  int v;
  String categoryId;
  bool active;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    pageUrl: json["pageUrl"],
    categoryImage: json["categoryImage"] == null ? null : List<dynamic>.from(json["categoryImage"].map((x) => x)),
    language: json["language"] == null ? null : json["language"],
    name: json["name"],
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
    categoryId: json["id"],
    active: json["active"] == null ? null : json["active"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "pageUrl": pageUrl,
    "categoryImage": categoryImage == null ? null : List<dynamic>.from(categoryImage.map((x) => x)),
    "language": language == null ? null : language,
    "name": name,
    "tenant": tenant,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "id": categoryId,
    "active": active == null ? null : active,
  };
}

class ServiceImage {
  ServiceImage({
    this.id,
    this.name,
    this.sizeInBytes,
    this.publicUrl,
    this.privateUrl,
    this.createdAt,
    this.updatedAt,
    this.serviceImageId,
    this.downloadUrl,
  });

  String id;
  String name;
  int sizeInBytes;
  dynamic publicUrl;
  String privateUrl;
  String createdAt;
  String updatedAt;
  String serviceImageId;
  String downloadUrl;

  factory ServiceImage.fromJson(Map<String, dynamic> json) => ServiceImage(
    id: json["_id"],
    name: json["name"],
    sizeInBytes: json["sizeInBytes"],
    publicUrl: json["publicUrl"],
    privateUrl: json["privateUrl"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    serviceImageId: json["id"],
    downloadUrl: json["downloadUrl"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "sizeInBytes": sizeInBytes,
    "publicUrl": publicUrl,
    "privateUrl": privateUrl,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "id": serviceImageId,
    "downloadUrl": downloadUrl,
  };
}