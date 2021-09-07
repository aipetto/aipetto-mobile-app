import 'dart:async';

import 'package:aipetto/modules/pet/repository/pet_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pet_form_event.dart';
part 'pet_form_state.dart';

class PetFormBloc extends Bloc<PetFormEvent, PetFormState>{

  final PetRepository repository;

  PetFormBloc({ @required this.repository }) : assert(repository != null), super(null);

  @override
  Stream<PetFormState> mapEventToState(PetFormEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}