part of 'pet_type_bloc.dart';

abstract class PetTypeState extends Equatable{

  PetTypeState();

  @override
  List<Object> get props => [];
}

class PetTypeEmpty extends PetTypeState{}

class PetTypeLoading extends PetTypeState{}

class PetTypeLoaded extends PetTypeState{
  final PetType petType;

  PetTypeLoaded({@required this.petType}) : assert(petType != null);

  @override
  List<Object> get props => [petType];
}

class PetTypeError extends PetTypeState{}