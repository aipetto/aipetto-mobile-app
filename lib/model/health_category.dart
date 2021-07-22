import 'dart:convert';

import 'package:flutter/material.dart';

class HealthCategory {
  int id;
  String name;
  String imagePath;

  HealthCategory({
    @required this.id,
    @required this.name,
    @required this.imagePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
    };
  }

  factory HealthCategory.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return HealthCategory(
      id: map['id'],
      name: map['name'],
      imagePath: map['imagePath'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HealthCategory.fromJson(String source) =>
      HealthCategory.fromMap(json.decode(source));
}

final healthCategories = [
  HealthCategory(
    id: 0,
    name: 'service_women_health',
    imagePath: 'assets/images/pregnant.png',
  ),
  HealthCategory(
    id: 1,
    name: 'service_skin',
    imagePath: 'assets/images/personal-care.png',
  ),
  HealthCategory(
    id: 2,
    name: 'service_child',
    imagePath: 'assets/images/baby.png',
  ),
  HealthCategory(
    id: 3,
    name: 'service_general_physician',
    imagePath: 'assets/images/stethoscope.png',
  ),
  HealthCategory(
    id: 4,
    name: 'service_dental',
    imagePath: 'assets/images/dental-care.png',
  ),
  HealthCategory(
    id: 5,
    name: 'service_ear',
    imagePath: 'assets/images/throat.png',
  ),
  HealthCategory(
    id: 6,
    name: 'service_homoetherapy',
    imagePath: 'assets/images/medicine.png',
  ),
  HealthCategory(
    id: 7,
    name: 'service_bone',
    imagePath: 'assets/images/knee.png',
  ),
  HealthCategory(
    id: 8,
    name: 'service_sex_specialist',
    imagePath: 'assets/images/sex.png',
  ),
  HealthCategory(
    id: 9,
    name: 'service_eye',
    imagePath: 'assets/images/view.png',
  ),
  HealthCategory(
    id: 10,
    name: 'service_digestive',
    imagePath: 'assets/images/stomach.png',
  ),
  HealthCategory(
    id: 11,
    name: 'service_mental',
    imagePath: 'assets/images/love.png',
  ),
  HealthCategory(
    id: 12,
    name: 'service_physiotherapy',
    imagePath: 'assets/images/healthcare-and-medical.png',
  ),
  HealthCategory(
    id: 13,
    name: 'service_diabetes',
    imagePath: 'assets/images/glucosemeter.png',
  ),
  HealthCategory(
    id: 14,
    name: 'service_brain',
    imagePath: 'assets/images/stethoscope-2.png',
  ),
  HealthCategory(
    id: 15,
    name: 'service_general_surgery',
    imagePath: 'assets/images/surgeon.png',
  ),
  HealthCategory(
    id: 16,
    name: 'service_lungs',
    imagePath: 'assets/images/lungs.png',
  ),
  HealthCategory(
    id: 17,
    name: 'service_heart',
    imagePath: 'assets/images/electrocardiogram.png',
  ),
  HealthCategory(
    id: 18,
    name: 'service_cancer',
    imagePath: 'assets/images/ribbon.png',
  ),
];
