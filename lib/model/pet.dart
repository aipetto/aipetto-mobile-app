import 'dart:convert';

import 'working_day.dart';

class Doctor {
  String id;
  String nickname;

  Doctor({
    this.id,
    this.nickname,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': nickname,
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Doctor(
      id: map['id'],
      nickname: map['nickname'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Doctor.fromJson(String source) => Doctor.fromMap(json.decode(source));
}

class Doctors {
  List<Doctor> doctorList;

  Doctors({this.doctorList});

  factory Doctors.fromJSON(Map<dynamic, dynamic> json) {
    return Doctors(doctorList: parserecipes(json));
  }

  static List<Doctor> parserecipes(doctorJSON) {
    var dList = doctorJSON['doctors'] as List;
    List<Doctor> doctorList =
    dList.map((data) => Doctor.fromJson(data)).toList();
    return doctorList;
  }
}

final doctors = [
  Doctor(
    name: 'Tawfiq Bahri',
    speciality: 'Family Doctor, Cardiologist',
    about:
    'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/icon_doctor_1.png',
    rating: 4.5,
    price: 100,
  ),
  Doctor(
    name: 'Trashae Hubbard',
    speciality: 'Family Doctor, Therapist',
    about:
    'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/icon_doctor_2.png',
    rating: 4.7,
    price: 90,
  ),
  Doctor(
    name: 'Jesus Moruga',
    speciality: 'Family Doctor, Therapist',
    about:
    'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/icon_doctor_3.png',
    rating: 4.3,
    price: 100,
  ),
  Doctor(
    name: 'Gabriel Moreira',
    speciality: 'Family Doctor, Therapist',
    about:
    'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/icon_doctor_4.png',
    rating: 4.7,
    price: 100,
  ),
  Doctor(
    name: 'Liana Lee',
    speciality: 'Family Doctor, Therapist',
    about:
    'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/icon_doctor_5.png',
    rating: 4.7,
    price: 100,
  ),
];
