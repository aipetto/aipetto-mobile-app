import 'dart:async';

import 'package:aipetto/modules/petType/models/pet_type.dart';
import 'package:aipetto/modules/petType/repository/pet_type_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'pet_type_event.dart';
part 'pet_type_state.dart';

class PetTypeBloc extends Bloc<PetTypeEvent, PetTypeState>{

  final PetTypeRepository repository;

  PetTypeBloc({ @required this.repository }) : assert(repository != null), super(null);

  @override
  PetTypeState get initialState => PetTypeEmpty();

  @override
  Stream<PetTypeState> mapEventToState( PetTypeEvent event ) async* {
    if(event is FetchPetType){
      yield PetTypeLoading();

      try{
        final PetType petType = await repository.fetchPetType();
        yield PetTypeLoaded(petType: petType);
      }catch (_){
        yield PetTypeError();
      }
    }
  }
}