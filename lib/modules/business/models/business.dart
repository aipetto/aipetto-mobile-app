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
  String location;
  double rating;
  double price;
  int idSpeciality;
  int goodReviews;
  int totaScore;
  int satisfaction;
  int visitDuration;

  Business({
    this.id = '',
    this.name = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.phone = '',
    this.speciality = '',
    this.about = '',
    this.avatar = '',
    this.location = '',
    this.rating = 0.0,
    this.price = 0.0,
    this.idSpeciality = 0,
    this.goodReviews = 0,
    this.totaScore = 0,
    this.satisfaction = 0,
    this.visitDuration = 0,
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
      'location': location,
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
      location: map['location'],
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