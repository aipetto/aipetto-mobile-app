import 'dart:convert';

import 'package:equatable/equatable.dart';

class Business extends Equatable {
  String id;
  String name;
  String firstName;
  String lastName;
  String email;
  String phone;
  String speciality;
  String about;
  String avatar;
  double rating;
  int price;
  int idSpeciality;
  int goodReviews;
  int totaScore;
  int satisfaction;
  int visitDuration;

  Business({
    this.id,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.speciality,
    this.about,
    this.avatar,
    this.rating,
    this.price,
    this.idSpeciality,
    this.goodReviews,
    this.totaScore,
    this.satisfaction,
    this.visitDuration,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'speciality': speciality,
      'about': about,
      'avatar': avatar,
      'rating': rating,
      'price': price,
      'idSpeciality': idSpeciality,
      'goodReviews': goodReviews,
      'totaScore': totaScore,
      'satisfaction': satisfaction,
      'visitDuration': visitDuration,
    };
  }

  factory Business.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Business(
      id: map['id'],
      name: map['name'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      phone: map['phone'],
      speciality: map['speciality'],
      about: map['about'],
      avatar: map['avatar'],
      rating: map['rating'],
      price: map['price'],
      idSpeciality: map['idSpeciality'],
      goodReviews: map['goodReviews'],
      totaScore: map['totaScore'],
      satisfaction: map['satisfaction'],
      visitDuration: map['visitDuration'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Business.fromJson(String source) =>
      Business.fromMap(json.decode(source));

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

final businesses = [
  Business(
    name: 'Veterinária Bons Amigos',
    speciality: 'Vet',
    about:
        'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/logos/veterinariabonsamigos.jpg',
    rating: 4.5,
    price: 100,
  ),
  Business(
    name: 'Salón Pet Belleza Buenos Aires',
    speciality: 'Beauty',
    about:
        'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/aipetto/grooming_color.png',
    rating: 4.5,
    price: 100,
  ),
  Business(
    name: 'Café Pet Friendly London',
    speciality: 'Human-Pet Spaces',
    about:
        'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/aipetto/cafe_pet_friendly.jpg',
    rating: 4.5,
    price: 100,
  ),
];
