import 'dart:async';

import 'package:aipetto/modules/pet/models/pet.dart';
import 'package:aipetto/modules/pet/services/petApiClient.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class PetRepository{
  final PetApiClient petClient;

  PetRepository({
    @required this.petClient }) : assert(petClient != null );


  Future<Pet> fetchPets() async {
    return await petClient.fetchUserPets();
  }

  Future<Pet> fetchPet(Pet pet, String tenant) async {
    return await petClient.fetchPet(pet, tenant);
  }

  Future<Pet> updatePet(Pet pet, String tenant) async {
    return await petClient.updatePet(pet, tenant);
  }

  Future<Pet> addPet(Pet pet) async {
    return await petClient.addPet(pet);
  }
}