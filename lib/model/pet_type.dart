import 'dart:convert';

import 'package:equatable/equatable.dart';

class PetType extends Equatable{

  String id;

  PetType({
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory PetType.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PetType(
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PetType.fromJson(String source) => PetType.fromMap(json.decode(source));

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Pet Type: {id: $id}';
}
