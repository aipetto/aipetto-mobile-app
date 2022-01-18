import 'dart:convert';

import 'package:equatable/equatable.dart';

class Notification extends Equatable {
  int id;
  String title;
  String body;
  String icon;
  String date;

  Notification({
    required this.id,
    required this.title,
    required this.body,
    required this.icon,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'icon': icon,
      'date': date,
    };
  }

  factory Notification.fromMap(Map<String, dynamic> map) {
    return Notification(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      icon: map['icon'],
      date: map['date'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Notification.fromJson(String source) =>
      Notification.fromMap(json.decode(source));

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

final notifications = [
  Notification(
    id: 1,
    title: 'Recordatorio de Reserva',
    body: 'No te olvides de tu reserva para desparasitar tu mascota',
    icon: 'assets/images/reminder.png',
    date: '2h',
  ),
  Notification(
    id: 2,
    title: 'Consejos de salud',
    body:
        'Caminar tu pet 30 minutos por día puede reducir 90% de las enfermedades del corazón',
    icon: 'assets/images/tip.png',
    date: '1d',
  ),
  Notification(
    id: 3,
    title: 'Appointment confirmation',
    body: 'Veterinaria aipetto confirmó la reserva para la vacunación',
    icon: 'assets/images/confirmation.png',
    date: '1d',
  ),
  Notification(
    id: 4,
    title: 'Recordatorio Médico - Check up',
    body: 'No te olvides de hacer el check-up general mensual',
    icon: 'assets/images/reminder.png',
    date: '1 semana',
  ),
  Notification(
    id: 5,
    title: 'Recordatorio de Receta',
    body:
        'Entre en contacto con la veterinaria Liana sobre la última prescipción',
    icon: 'assets/images/reminder.png',
    date: '1 semana',
  ),
];
