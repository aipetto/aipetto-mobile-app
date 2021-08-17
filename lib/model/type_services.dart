import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TypeServices extends Equatable{
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

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

final typeServices = [
  TypeServices(
    id: 0,
    name: 'service_grooming',
    imagePath: 'assets/images/aipetto/grooming_color.png',
  ),
  TypeServices(
    id: 1,
    name: 'service_vaccine',
    imagePath: 'assets/images/aipetto/syringe.png',
  ),
  TypeServices(
    id: 2,
    name: 'service_transport',
    imagePath: 'assets/images/aipetto/van_alternative.png',
  ),
  TypeServices(
    id: 3,
    name: 'service_ultrasound',
    imagePath: 'assets/images/aipetto/ultrasound.png',
  ),
  TypeServices(
    id: 4,
    name: 'service_microchip',
    imagePath: 'assets/images/aipetto/pet-microchip.png',
  ),
  TypeServices(
    id: 5,
    name: 'service_spay_neuter',
    imagePath: 'assets/images/aipetto/icon_examination.png',
  ),
];
