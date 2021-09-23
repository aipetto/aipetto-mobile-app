import 'dart:async';

import 'package:aipetto/modules/auth/services/auth_service.dart';
import 'package:aipetto/modules/pet/bloc/form/pet_form_bloc.dart';
import 'package:aipetto/modules/pet/models/pets.dart';
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
  StreamSubscription newPetFormSubscription;

  PetBloc({@required this.authenticationService, @required this.petRepository}) :
        assert(petRepository != null),
        super(PetEmpty());

  @override
  PetState get initialState => PetEmpty();

  @override
  void dispose() {
    newPetFormSubscription?.cancel();
  }

  @override
  Stream<PetState> mapEventToState( PetEvent event ) async* {

    // TODO Check PetForm StreamSubscription to component/widget under the PetBloc in Widgets Tree
    final PetFormBloc newPetFormBloc = PetFormBloc(repository: petRepository);
    newPetFormSubscription = newPetFormBloc.listen((state) {
      if(state is PetFormSuccess){
        add(FetchPets());
      }
    });

    if(event is FetchPets){
      yield PetLoading();
      try{
        final User currentUser = await authenticationService.getCurrentUser();
        final List<Pet> pets = await petRepository.fetchPets(currentUser.tenants.first.tenant.id);
        yield PetsLoaded(pets: pets);
      }catch (_){
        yield PetError();
      }
    }

    if(event is FetchPet){
      yield PetLoading();
      try{
        //final Pet pet = await petRepository.fetchPet(event.pet);
        //yield PetLoaded(pet: pet);
      }catch (_){
        yield PetError();
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
        yield PetError();
      }
    }
  }
}