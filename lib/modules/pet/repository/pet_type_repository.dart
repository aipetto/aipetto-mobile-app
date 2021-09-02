import 'dart:async';

import 'package:aipetto/modules/pet/models/pet.dart';
import 'package:aipetto/modules/pet/services/petApiClient.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class PetRepository{
  final PetApiClient petClient;

  PetRepository({
    @required this.petClient }) : assert(petClient != null );


  Future<Pet> fetchPet() async {
    return await petClient.fetchUserPets();
  }
}