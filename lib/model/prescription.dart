import 'dart:convert';

import 'veterinarian.dart';

class Prescription {
  String id;
  String name;
  DateTime date;
  String userId;
  String veterinarianId;
  Veterinarian veterinarian;

  Prescription({
    this.id,
    this.name,
    this.date,
    this.userId,
    this.veterinarianId,
    this.veterinarian,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'date': date?.millisecondsSinceEpoch,
      'userId': userId,
      'veterinarianId': veterinarianId,
      'veterinarian': veterinarian?.toMap(),
    };
  }

  factory Prescription.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Prescription(
      id: map['id'],
      name: map['name'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      userId: map['userId'],
      veterinarianId: map['veterinarianId'],
      veterinarian: Veterinarian.fromMap(map['veterinarian']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Prescription.fromJson(String source) =>
      Prescription.fromMap(json.decode(source));
}
