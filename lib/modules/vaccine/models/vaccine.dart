import 'dart:convert';

import 'package:equatable/equatable.dart';

class Vaccine extends Equatable {
  String id;

  Vaccine({
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory Vaccine.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Vaccine(
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Vaccine.fromJson(String source) =>
      Vaccine.fromMap(json.decode(source));

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Vaccine: {id: $id}';
}
