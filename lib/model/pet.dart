import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'working_day.dart';

class Pet extends Equatable{
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

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

/// TODO Refactor this class
class Pets {
  List<Pet> petList;

  Pets({this.petList});

  factory Pets.fromJSON(Map<dynamic, dynamic> json) {
    return Pets(petList: parserecipes(json));
  }

  static List<Pet> parserecipes(veterinarianJSON) {
    var dList = veterinarianJSON['veterinarians'] as List;
    List<Pet> petList =
    dList.map((data) => Pet.fromJson(data)).toList();
    return petList;
  }
}

final veterinarians = [
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
      name: 'Sparrow',
      nickname: 'Piratinha',
      profileImage: 'assets/images/pets/cat_3.jpg'
  ),
  Pet(
      name: 'Big',
      nickname: 'Bigguinho',
      profileImage: 'assets/images/pets/pet_2.jpg'
  ),
  Pet(
      name: 'Amanda',
      nickname: 'Rainha',
      profileImage: 'assets/images/pets/cat_1.jpg'
  ),
  Pet(
      name: 'CDF',
      nickname: 'Nerd',
      profileImage: 'assets/images/pets/cat_2.jpg'
  )
];