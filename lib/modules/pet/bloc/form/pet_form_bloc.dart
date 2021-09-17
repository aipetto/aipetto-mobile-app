import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:aipetto/modules/pet/models/pet.dart';
import 'package:aipetto/modules/pet/repository/pet_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'pet_form_event.dart';
part 'pet_form_state.dart';

class PetFormBloc extends Bloc<PetFormEvent, PetFormState>{

  final PetRepository repository;

  PetFormBloc({
    @required this.repository,
  }) : assert(repository != null), super(null);

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  Stream<PetFormState> mapEventToState(PetFormEvent event) async* {
    if (event is NewPetFormButtonPressed) {
      yield* _mapNewPetToState(event);
    }
  }

  Stream<PetFormState> _mapNewPetToState(NewPetFormButtonPressed event) async* {
    yield PetFormLoading();
    try{
        await repository.addPet(event.pet, event.fileImageProfile);
        yield PetFormSuccess();
    } catch (err ) {
      yield PetFormFailure('unknown_failure_error'. tr());
    }
  }
}