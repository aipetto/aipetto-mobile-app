import 'dart:convert';

import 'veterinarian.dart';

class Booking {

  String id;
  Veterinarian veterinarian;
  String veterinarianId;
  String userId;
  String date; // Monday, 3 Feb
  String formattedDate; // dd-MM-yyyy
  String time; // 08:00 AM
  String patient;
  String mobile;
  String patientMobile;
  String email;
  int healthConcern;

  Booking({
    this.id,
    this.veterinarian,
    this.veterinarianId,
    this.userId,
    this.date,
    this.formattedDate,
    this.time,
    this.patient,
    this.mobile,
    this.patientMobile,
    this.email,
    this.healthConcern,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'veterinarian': veterinarian?.toMap(),
      'veterinarianId': veterinarianId,
      'userId': userId,
      'date': date,
      'formattedDate': formattedDate,
      'time': time,
      'patient': patient,
      'mobile': mobile,
      'patientMobile': patientMobile,
      'email': email,
      'healthConcern': healthConcern,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Booking(
      id: map['id'],
      veterinarian: Veterinarian.fromMap(map['veterinarian']),
      veterinarianId: map['veterinarianId'],
      userId: map['userId'],
      date: map['date'],
      formattedDate: map['formattedDate'],
      time: map['time'],
      patient: map['patient'],
      mobile: map['mobile'],
      patientMobile: map['patientMobile'],
      email: map['email'],
      healthConcern: map['healthConcern'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) =>
      Booking.fromMap(json.decode(source));
}
