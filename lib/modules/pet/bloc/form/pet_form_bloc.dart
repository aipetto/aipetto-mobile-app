import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:aipetto/modules/pet/models/pets.dart';
import 'package:aipetto/modules/pet/repository/pet_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'pet_form_event.dart';
part 'pet_form_state.dart';

class PetFormBloc extends Bloc<PetFormEvent, PetFormState> {
  final PetRepository repository;

  PetFormBloc({
    required this.repository,
  }) : super(PetFormInitial());

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  Stream<PetFormState> mapEventToState(PetFormEvent event) async* {
    if (event is NewPetFormButtonPressed) {
      yield* _mapNewPetToState(event);
    }

    if (event is DeletePetFormButtonPressed) {
      yield* _mapDeletePetToState(event);
    }
  }

  Stream<PetFormState> _mapNewPetToState(NewPetFormButtonPressed event) async* {
    yield PetFormLoading();
    try {
      var petAdded = await repository.addPet(event.pet, event.fileImageProfile);
      yield PetFormSuccess(pet: petAdded);
    } catch (err) {
      yield PetFormFailure('unknown_failure_error'.tr());
    }
  }

  Stream<PetFormState> _mapDeletePetToState(DeletePetFormButtonPressed event) async* {
    yield PetFormLoading();
    try {
      await repository.deletePet(event.pet);
      yield PetDeleteSuccess();
    } catch (err) {
      yield PetFormFailure('unknown_failure_error'.tr());
    }
  }
}
