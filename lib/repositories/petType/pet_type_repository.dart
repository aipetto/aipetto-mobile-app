import 'dart:async';

import 'package:meta/meta.dart';
import 'package:aipetto/model/models.dart';
import 'package:aipetto/repositories/petType/petTypeApiClient.dart';
import 'package:flutter/material.dart';

class PetTypeRepository{
  final PetTypeApiClient petTypeClient;

  PetTypeRepository({
    @required this.petTypeClient }) : assert(petTypeClient != null );


  Future<PetType> fetchPetType() async {
    return await petTypeClient.fetchPetTypes();
  }
}