import 'dart:convert';

import 'package:equatable/equatable.dart';

class PetBreed extends Equatable {
  String id;

  PetBreed({
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory PetBreed.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PetBreed(
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PetBreed.fromJson(String source) =>
      PetBreed.fromMap(json.decode(source));

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Pet Breed: {id: $id}';
}
