import 'dart:async';

import 'package:aipetto/modules/petType/models/pet_type.dart';
import 'package:aipetto/modules/petType/services/petTypeApiClient.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

class PetTypeRepository {
  final PetTypeApiClient petTypeClient;

  PetTypeRepository({@required this.petTypeClient})
      : assert(petTypeClient != null);

  Future<PetType> fetchPetType() async {
    return await petTypeClient.fetchPetTypes();
  }
}
