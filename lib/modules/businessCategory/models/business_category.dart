import 'dart:convert';

import 'package:equatable/equatable.dart';

class BusinessCategory extends Equatable {
  String id;

  BusinessCategory({
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory BusinessCategory.fromMap(Map<String, dynamic> map) {
    return BusinessCategory(
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessCategory.fromJson(String source) =>
      BusinessCategory.fromMap(json.decode(source));

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Business Category: {id: $id}';
}
