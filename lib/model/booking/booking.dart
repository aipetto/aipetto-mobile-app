import 'dart:convert';

import '../veterinarian/veterinarian.dart';
import 'package:equatable/equatable.dart';

class Booking extends Equatable{

  String id;
  Veterinarian veterinarian;
  String veterinarianId;
  String userId;
  String date; // Monday, 3 Feb
  String formattedDate; // dd-MM-yyyy
  String time; // 08:00 AM
  String customer;
  String mobile;
  String customerMobile;
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
    this.customer,
    this.mobile,
    this.customerMobile,
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
      'customer': customer,
      'mobile': mobile,
      'customerMobile': customerMobile,
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
      customer: map['customer'],
      mobile: map['mobile'],
      customerMobile: map['customerMobile'],
      email: map['email'],
      healthConcern: map['healthConcern'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) =>
      Booking.fromMap(json.decode(source));

  @override
  List<Object> get props => [id, date, time];

  @override
  String toString() => 'Booking: {id: $id}';
}
