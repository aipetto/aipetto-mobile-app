import 'dart:convert';

import 'working_day.dart';

class Business {
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
  List<WorkingDay> workingDays;

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
    this.workingDays,
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
      'workingDays': workingDays?.map((x) => x?.toMap())?.toList(),
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
      workingDays: List<WorkingDay>.from(
          map['workingDays']?.map((x) => WorkingDay.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Business.fromJson(String source) => Business.fromMap(json.decode(source));
}

final businesses = [
  Business(
    name: 'Veterinária Bons Amigos',
    speciality: 'Family Veterinarian, Cardiologist',
    about:
    'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/logos/veterinariabonsamigos.jpg',
    rating: 4.5,
    price: 100,
  ),
  Business(
    name: 'Veterinária Bons Amigos',
    speciality: 'Family Veterinarian, Cardiologist',
    about:
    'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/logos/veterinariabonsamigos.jpg',
    rating: 4.5,
    price: 100,
  ),
  Business(
    name: 'Veterinária Bons Amigos',
    speciality: 'Family Veterinarian, Cardiologist',
    about:
    'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/logos/veterinariabonsamigos.jpg',
    rating: 4.5,
    price: 100,
  ),
];
