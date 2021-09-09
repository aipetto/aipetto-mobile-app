import 'dart:async';
import 'dart:core';

import 'package:aipetto/modules/auth/bloc/authentication_bloc.dart';
import 'package:aipetto/modules/pet/models/pet.dart';
import 'package:aipetto/modules/pet/repository/pet_repository.dart';
import 'package:aipetto/modules/user/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'pet_form_event.dart';
part 'pet_form_state.dart';

class PetFormBloc extends Bloc<PetFormEvent, PetFormState>{

  final PetRepository repository;
  final AuthenticationBloc userAuthenticationBloc;
  StreamSubscription userAuthenticationBlocSubscription;

  PetFormBloc({
    @required this.repository,
    @required this.userAuthenticationBloc,
  }) : assert(repository != null), super(null);

  @override
  Future<void> close() {
    userAuthenticationBlocSubscription?.cancel();
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
    final userAuthenticationState = userAuthenticationBloc.state;
    try{
      userAuthenticationBloc.listen((AuthenticationState) {
          print('ok');
      });
      print('1ahok');
      yield PetFormSuccess();
      ///final authenticationUserState = BlocProvider.of<AuthenticationBloc>(context).state;
      /// final pet = await repository.addPet(event.pet, state.user.tenants.first.id);
    } catch (err ) {
      //.yield PetFormFailure(error: 'unknown_failure_error'.tr());
    }
  }
}