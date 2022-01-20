import 'dart:async';
import 'dart:io';

import 'package:aipetto/modules/pet/models/pets.dart';
import 'package:aipetto/modules/pet/services/petApiClient.dart';

class PetRepository {
  final PetApiClient petClient;

  PetRepository({required this.petClient}) : assert(petClient != null);

  Future<List<Pet>> fetchPets(String? userTenantId) async {
    return await petClient.fetchUserPets(userTenantId);
  }

  Future<Pet> fetchPet(Pet pet) async {
    return await petClient.fetchPet(pet);
  }

  Future<Pet> updatePet(Pet pet, String tenant) async {
    return await petClient.updatePet(pet);
  }

  Future<Pet> addPet(Pet pet, File profileImage) async {
    return await petClient.addPet(pet, profileImage);
  }

  Future<void> deletePet(Pet? pet) async {
    return await petClient.deletePet(pet);
  }

}
