part of 'pet_type_bloc.dart';

@immutable
abstract class PetTypeEvent extends Equatable{}

class FetchPetType extends PetTypeEvent{

  FetchPetType();

  @override
  List<Object> get props => [];
}