import 'dart:convert';

import 'working_day.dart';

class Pet {
  String id;
  String name;
  String nickname;
  String profileImage;

  Pet({
    this.id,
    this.name,
    this.nickname,
    this.profileImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'nickname': nickname,
      'profileImage': profileImage
    };
  }

  factory Pet.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Pet(
      id: map['id'],
      name: map['name'],
      nickname: map['nickname'],
      profileImage: map['profileImage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Pet.fromJson(String source) => Pet.fromMap(json.decode(source));
}

/// TODO Refactor this class
class Pets {
  List<Pet> petList;

  Pets({this.petList});

  factory Pets.fromJSON(Map<dynamic, dynamic> json) {
    return Pets(petList: parserecipes(json));
  }

  static List<Pet> parserecipes(doctorJSON) {
    var dList = doctorJSON['doctors'] as List;
    List<Pet> petList =
    dList.map((data) => Pet.fromJson(data)).toList();
    return petList;
  }
}

final doctors = [
  Pet(
    nickname: 'Supet Pet',
  ),
];

final pets = [
  Pet(
    name: 'Snoopy',
    nickname: 'Duchinho',
    profileImage: 'assets/images/pets/snoopy.jpg'
  ),
  Pet(
      name: 'Snoopy',
      nickname: 'Duchinho',
      profileImage: 'assets/images/pets/snoopy.jpg'
  ),
  Pet(
      name: 'Snoopy',
      nickname: 'Duchinho',
      profileImage: 'assets/images/pets/snoopy.jpg'
  ),
  Pet(
      name: 'Snoopy',
      nickname: 'Duchinho',
      profileImage: 'assets/images/pets/snoopy.jpg'
  ),
  Pet(
      name: 'Snoopy',
      nickname: 'Duchinho',
      profileImage: 'assets/images/pets/snoopy.jpg'
  )
];