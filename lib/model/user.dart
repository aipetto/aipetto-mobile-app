// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User extends Equatable{
  User({
    this.emailVerified,
    this.id,
    this.email,
    this.providerId,
    this.provider,
    this.firstName,
    this.lastName,
    this.fullName,
    this.avatars,
    this.tenants,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.updatedBy,
    this.phoneNumber,
    this.jwtTokenInvalidBefore,
    this.userId,
  });

  bool emailVerified;
  String id;
  String email;
  String providerId;
  String provider;
  String firstName;
  String lastName;
  String fullName;
  List<Avatar> avatars;
  List<TenantElement> tenants;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String updatedBy;
  dynamic phoneNumber;
  DateTime jwtTokenInvalidBefore;
  String userId;

  factory User.fromJson(Map<String, dynamic> json) => User(
    emailVerified: json["emailVerified"],
    id: json["_id"],
    email: json["email"],
    providerId: json["providerId"],
    provider: json["provider"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    fullName: json["fullName"],
    avatars: List<Avatar>.from(json["avatars"].map((x) => Avatar.fromJson(x))),
    tenants: List<TenantElement>.from(json["tenants"].map((x) => TenantElement.fromJson(x))),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    updatedBy: json["updatedBy"],
    phoneNumber: json["phoneNumber"],
    jwtTokenInvalidBefore: DateTime.parse(json["jwtTokenInvalidBefore"]),
    userId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "emailVerified": emailVerified,
    "_id": id,
    "email": email,
    "providerId": providerId,
    "provider": provider,
    "firstName": firstName,
    "lastName": lastName,
    "fullName": fullName,
    "avatars": List<dynamic>.from(avatars.map((x) => x.toJson())),
    "tenants": List<dynamic>.from(tenants.map((x) => x.toJson())),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "updatedBy": updatedBy,
    "phoneNumber": phoneNumber,
    "jwtTokenInvalidBefore": jwtTokenInvalidBefore.toIso8601String(),
    "id": userId,
  };

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class Avatar {
  Avatar({
    this.id,
    this.name,
    this.sizeInBytes,
    this.publicUrl,
    this.privateUrl,
    this.updatedAt,
    this.createdAt,
    this.avatarId,
    this.downloadUrl,
  });

  String id;
  String name;
  int sizeInBytes;
  String publicUrl;
  String privateUrl;
  DateTime updatedAt;
  DateTime createdAt;
  String avatarId;
  String downloadUrl;

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
    id: json["_id"],
    name: json["name"],
    sizeInBytes: json["sizeInBytes"],
    publicUrl: json["publicUrl"],
    privateUrl: json["privateUrl"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
    avatarId: json["id"],
    downloadUrl: json["downloadUrl"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "sizeInBytes": sizeInBytes,
    "publicUrl": publicUrl,
    "privateUrl": privateUrl,
    "updatedAt": updatedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "id": avatarId,
    "downloadUrl": downloadUrl,
  };
}

class TenantElement {
  TenantElement({
    this.roles,
    this.id,
    this.tenant,
    this.status,
    this.updatedAt,
    this.createdAt,
    this.tenantId,
  });

  List<String> roles;
  String id;
  TenantTenant tenant;
  String status;
  DateTime updatedAt;
  DateTime createdAt;
  String tenantId;

  factory TenantElement.fromJson(Map<String, dynamic> json) => TenantElement(
    roles: List<String>.from(json["roles"].map((x) => x)),
    id: json["_id"],
    tenant: TenantTenant.fromJson(json["tenant"]),
    status: json["status"],
    updatedAt: DateTime.parse(json["updatedAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
    tenantId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "roles": List<dynamic>.from(roles.map((x) => x)),
    "_id": id,
    "tenant": tenant.toJson(),
    "status": status,
    "updatedAt": updatedAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "id": tenantId,
  };
}

class TenantTenant {
  TenantTenant({
    this.plan,
    this.planStatus,
    this.id,
    this.name,
    this.url,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.tenantId,
    this.settings,
  });

  String plan;
  String planStatus;
  String id;
  String name;
  String url;
  String createdBy;
  String updatedBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String tenantId;
  Settings settings;

  factory TenantTenant.fromJson(Map<String, dynamic> json) => TenantTenant(
    plan: json["plan"],
    planStatus: json["planStatus"],
    id: json["_id"],
    name: json["name"],
    url: json["url"],
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    tenantId: json["id"],
    settings: Settings.fromJson(json["settings"]),
  );

  Map<String, dynamic> toJson() => {
    "plan": plan,
    "planStatus": planStatus,
    "_id": id,
    "name": name,
    "url": url,
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": tenantId,
    "settings": settings.toJson(),
  };
}

class Settings {
  Settings({
    this.id,
    this.theme,
    this.tenant,
    this.createdBy,
    this.backgroundImages,
    this.logos,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.settingsId,
  });

  String id;
  String theme;
  String tenant;
  String createdBy;
  List<dynamic> backgroundImages;
  List<dynamic> logos;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String settingsId;

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
    id: json["_id"],
    theme: json["theme"],
    tenant: json["tenant"],
    createdBy: json["createdBy"],
    backgroundImages: List<dynamic>.from(json["backgroundImages"].map((x) => x)),
    logos: List<dynamic>.from(json["logos"].map((x) => x)),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    settingsId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "theme": theme,
    "tenant": tenant,
    "createdBy": createdBy,
    "backgroundImages": List<dynamic>.from(backgroundImages.map((x) => x)),
    "logos": List<dynamic>.from(logos.map((x) => x)),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "id": settingsId,
  };
}
