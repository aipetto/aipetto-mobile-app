part of 'pet_form_bloc.dart';

@immutable
abstract class PetFormEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NewPetFormButtonPressed extends PetFormEvent {
  final Pet pet;
  final File fileImageProfile;

  NewPetFormButtonPressed({required this.pet,required this.fileImageProfile});

  @override
  List<Object> get props => [pet];
}

class DeletePetFormButtonPressed extends PetFormEvent {
  final Pet? pet;

  DeletePetFormButtonPressed({required this.pet});
}
