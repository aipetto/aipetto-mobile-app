import 'dart:convert';

import 'package:equatable/equatable.dart';

class BusinessPlace extends Equatable {
  String id;

  BusinessPlace({
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory BusinessPlace.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return BusinessPlace(
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessPlace.fromJson(String source) =>
      BusinessPlace.fromMap(json.decode(source));

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Business Place: {id: $id}';
}
