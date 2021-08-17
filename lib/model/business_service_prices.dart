import 'dart:convert';

import 'package:equatable/equatable.dart';

class BusinessServicePrices extends Equatable{

  String id;

  BusinessServicePrices({
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory BusinessServicePrices.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return BusinessServicePrices(
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BusinessServicePrices.fromJson(String source) => BusinessServicePrices.fromMap(json.decode(source));

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Business Service Price: {id: $id}';
}
