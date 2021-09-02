import 'dart:async';

import 'package:aipetto/modules/pet/models/pet.dart';
import 'package:aipetto/modules/pet/repository/pet_type_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'pet_event.dart';
part 'pet_state.dart';

class PetBloc extends Bloc<PetEvent, PetState>{

  final PetRepository repository;

  PetBloc({ @required this.repository }) : assert(repository != null), super(null);

  @override
  PetState get initialState => PetEmpty();

  @override
  Stream<PetState> mapEventToState( PetEvent event ) async* {
    if(event is FetchPet){
      yield PetLoading();

      try{
        final Pet pet = await repository.fetchPet();
        yield PetLoaded(pet: pet);
      }catch (_){
        yield PetTypeError();
      }
    }
  }
}