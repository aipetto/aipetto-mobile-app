import 'dart:convert';

import 'package:flutter/material.dart';

class TypeServices {
  int id;
  String name;
  String imagePath;

  TypeServices({
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

  factory TypeServices.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TypeServices(
      id: map['id'],
      name: map['name'],
      imagePath: map['imagePath'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TypeServices.fromJson(String source) =>
      TypeServices.fromMap(json.decode(source));
}

final typeServices = [
  TypeServices(
    id: 0,
    name: 'category_women_health',
    imagePath: 'assets/images/aipetto/vet.png',
  ),
  TypeServices(
    id: 1,
    name: 'category_skin',
    imagePath: 'assets/images/personal-care.png',
  ),
  TypeServices(
    id: 2,
    name: 'category_child',
    imagePath: 'assets/images/baby.png',
  ),
  TypeServices(
    id: 3,
    name: 'category_general_physician',
    imagePath: 'assets/images/stethoscope.png',
  ),
  TypeServices(
    id: 4,
    name: 'category_dental',
    imagePath: 'assets/images/dental-care.png',
  ),
  TypeServices(
    id: 5,
    name: 'category_ear',
    imagePath: 'assets/images/throat.png',
  ),
  TypeServices(
    id: 6,
    name: 'category_homoetherapy',
    imagePath: 'assets/images/medicine.png',
  ),
  TypeServices(
    id: 7,
    name: 'category_bone',
    imagePath: 'assets/images/knee.png',
  )
];
