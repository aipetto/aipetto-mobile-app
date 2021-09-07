part of 'pet_bloc.dart';

@immutable
abstract class PetEvent extends Equatable{}

class FetchPets extends PetEvent{

  FetchPets();

  @override
  List<Object> get props => [];
}

class FormAddNewPetScreenSubmit{
  final String name;

  FormAddNewPetScreenSubmit(this.name);
}

class UpdatePet extends PetEvent{
  UpdatePet();

  @override
  List<Object> get props => [];
}