import 'dart:convert';

import 'package:equatable/equatable.dart';

class ServiceAvailability extends Equatable{

  String id;

  ServiceAvailability({
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory ServiceAvailability.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ServiceAvailability(
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ServiceAvailability.fromJson(String source) => ServiceAvailability.fromMap(json.decode(source));

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Service Availability: {id: $id}';
}
