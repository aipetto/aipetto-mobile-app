import 'dart:convert';

import 'package:equatable/equatable.dart';

class Message extends Equatable {
  String id;

  Message({
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Message(
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source));

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'Message: {id: $id}';
}
