part of 'pet_bloc.dart';

abstract class PetState extends Equatable {
  PetState();

  @override
  List<Object> get props => [];
}

class PetEmpty extends PetState {}

class PetLoading extends PetState {}

class PetsLoaded extends PetState {
  final List<Pet> pets;

  PetsLoaded({@required this.pets}) : assert(pets != null);

  @override
  List<Object> get props => [pets];
}

class PetLoaded extends PetState {
  final Pet pet;

  PetLoaded({@required this.pet}) : assert(pet != null);

  @override
  List<Object> get props => [pet];
}

class PetError extends PetState {}
