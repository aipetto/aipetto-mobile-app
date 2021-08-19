import 'dart:convert';

import 'package:equatable/equatable.dart';

class Notification extends Equatable{
  int id;
  String title;
  String body;
  String icon;
  String date;

  Notification({
    this.id,
    this.title,
    this.body,
    this.icon,
    this.date,
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
    if (map == null) return null;

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
    title: 'Recordatorio de Reserva',
    body: 'No te olvides de tu reserva para desparasitar tu mascota',
    icon: 'assets/images/reminder.png',
    date: '2h',
  ),
  Notification(
    title: 'Consejos de salud',
    body: 'Caminar tu pet 30 minutos por día puede reducir 90% de las enfermedades del corazón',
    icon: 'assets/images/tip.png',
    date: '1d',
  ),
  Notification(
    title: 'Appointment confirmation',
    body: 'Veterinaria aipetto confirmó la reserva para la vacunación',
    icon: 'assets/images/confirmation.png',
    date: '1d',
  ),
  Notification(
    title: 'Recordatorio Médico - Check up',
    body: 'No te olvides de hacer el check-up general mensual',
    icon: 'assets/images/reminder.png',
    date: '1 semana',
  ),
  Notification(
    title: 'Recordatorio de Receta',
    body: 'Entre en contacto con la veterinaria Liana sobre la última prescipción',
    icon: 'assets/images/reminder.png',
    date: '1 semana',
  ),
];
