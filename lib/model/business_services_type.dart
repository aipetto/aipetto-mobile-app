import 'dart:convert';

import 'package:equatable/equatable.dart';

class BusinessServiceType extends Equatable{

  String id;

  BusinessServiceType({
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory BusinessServiceType.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return BusinessServiceType(
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessServiceType.fromJson(String source) => BusinessServiceType.fromMap(json.decode(source));

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Business Service Type: {id: $id}';
}
