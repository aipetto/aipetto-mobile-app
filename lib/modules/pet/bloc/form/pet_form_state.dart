part of 'pet_form_bloc.dart';

abstract class PetFormState extends Equatable{

  @override
  List<Object> get props => [];
}

class PetFormInitial extends PetFormState{}

class PetFormLoading extends PetFormState{}

class PetFormSuccess extends PetFormState{}

class PetFormFailure extends PetFormState{
  final String error;

  PetFormFailure(this.error);

  @override
  List<Object> get props => [error];
}