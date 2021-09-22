import 'dart:async';

import 'package:aipetto/modules/auth/services/auth_service.dart';
import 'package:aipetto/modules/pet/models/pet.dart';
import 'package:aipetto/modules/pet/repository/pet_repository.dart';
import 'package:aipetto/modules/user/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'pet_event.dart';
part 'pet_state.dart';

class PetBloc extends Bloc<PetEvent, PetState>{

  final PetRepository petRepository;
  final AuthenticationService authenticationService;

  PetBloc({@required this.authenticationService, @required this.petRepository}) :
        assert(petRepository != null),
        super(PetEmpty());

  @override
  PetState get initialState => PetEmpty();

  @override
  Stream<PetState> mapEventToState( PetEvent event ) async* {
    if(event is FetchPets){
      yield PetLoading();

      try{
        final User currentUser = await authenticationService.getCurrentUser();
        final Pet pet = await petRepository.fetchPets(currentUser.tenants.first.tenant.id);
        yield PetLoaded(pet: pet);
      }catch (_){
        yield PetTypeError();
      }
    }

    if(event is UpdatePet){
      yield PetLoading();
      try{
        // get current tenant from user state
        // await petRepository.updatePet(pet);
          // Inside petRepository Prototype pattern pet.copyWith(onlyNewFieldsToUpdate)
        yield PetLoaded();
      }catch (_){
        yield PetTypeError();
      }
    }
  }
}