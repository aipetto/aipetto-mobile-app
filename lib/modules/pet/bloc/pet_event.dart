part of 'pet_bloc.dart';

@immutable
abstract class PetEvent extends Equatable{}

class FetchPet extends PetEvent{

  FetchPet();

  @override
  List<Object> get props => [];
}