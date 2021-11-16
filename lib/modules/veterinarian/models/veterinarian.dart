import 'dart:convert';

class Veterinarian {
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
  double price;
  int idSpeciality;
  int goodReviews;
  int totaScore;
  int satisfaction;
  int visitDuration;

  Veterinarian({
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

  factory Veterinarian.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Veterinarian(
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

  factory Veterinarian.fromJson(String source) =>
      Veterinarian.fromMap(json.decode(source));
}

class Veterinarians {
  List<Veterinarian> veterinarianList;

  Veterinarians({this.veterinarianList});

  factory Veterinarians.fromJSON(Map<dynamic, dynamic> json) {
    return Veterinarians(veterinarianList: parserecipes(json));
  }

  static List<Veterinarian> parserecipes(veterinarianJSON) {
    var dList = veterinarianJSON['veterinarians'] as List;
    List<Veterinarian> veterinarianList =
        dList.map((data) => Veterinarian.fromJson(data)).toList();
    return veterinarianList;
  }
}

final veterinarians = [
  Veterinarian(
    name: 'Dr Vidal CRMV 11111',
    speciality: 'Family Veterinarian, Cardiologist',
    about:
        'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/icon_veterinarian_1.png',
    rating: 4.5,
    price: 100,
  ),
  Veterinarian(
    name: 'Trashae Hubbard',
    speciality: 'Family Veterinarian, Therapist',
    about:
        'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/icon_veterinarian_2.png',
    rating: 4.7,
    price: 90,
  ),
  Veterinarian(
    name: 'Jesus Moruga',
    speciality: 'Family Veterinarian, Therapist',
    about:
        'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/icon_veterinarian_3.png',
    rating: 4.3,
    price: 100,
  ),
  Veterinarian(
    name: 'Gabriel Moreira',
    speciality: 'Family Veterinarian, Therapist',
    about:
        'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/icon_veterinarian_4.png',
    rating: 4.7,
    price: 100,
  ),
  Veterinarian(
    name: 'Liana Lee',
    speciality: 'Family Veterinarian, Therapist',
    about:
        'Candidate of medical sciences, gynecologist, specialist with experience more than 5 years.',
    avatar: 'assets/images/icon_veterinarian_5.png',
    rating: 4.7,
    price: 100,
  ),
];
