import 'dart:convert';

class Visit {
  String id;
  DateTime date;
  String address;
  String diagnosis;
  String recommendation;
  String userId;
  String veterinarianId;

  Visit({
    this.id,
    this.date,
    this.address,
    this.diagnosis,
    this.recommendation,
    this.userId,
    this.veterinarianId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date?.millisecondsSinceEpoch,
      'address': address,
      'diagnosis': diagnosis,
      'recommendation': recommendation,
      'userId': userId,
      'veterinarianId': veterinarianId,
    };
  }

  factory Visit.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Visit(
      id: map['id'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      address: map['address'],
      diagnosis: map['diagnosis'],
      recommendation: map['recommendation'],
      userId: map['userId'],
      veterinarianId: map['veterinarianId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Visit.fromJson(String source) => Visit.fromMap(json.decode(source));
}
