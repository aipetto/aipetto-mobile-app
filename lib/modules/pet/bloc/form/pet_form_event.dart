part of 'pet_form_bloc.dart';

@immutable
abstract class PetFormEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class NewPetFormButtonPressed extends PetFormEvent{

  final Pet pet;

  NewPetFormButtonPressed({Pet this.pet});

  @override
  List<Object> get props => [pet];
}