import 'dart:convert';

import 'package:equatable/equatable.dart';

class Exam extends Equatable {
  String id;

  Exam({
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory Exam.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Exam(
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Exam.fromJson(String source) => Exam.fromMap(json.decode(source));

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Exam: {id: $id}';
}
