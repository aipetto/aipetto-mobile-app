part of 'pet_form_bloc.dart';

@immutable
abstract class PetFormEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class NewPetFormButtonPressed extends PetFormEvent{

  final String name;
  final bool hasBeenVaccinated;
  final bool hasBeenDewormed;
  final bool hasBeenSterilizedSpayed;
  final bool isLookingForMatch;
  final bool isGuideDog;
  final bool hasMicrochip;
  final Breed type;
  final String sex;
  final String color; /// enum and static multi-language Black, White, Brown, Gray, Chocolate, Gold, Blue, Cream, Yellow
  final int age;
  final DateTime birthdate;
  final List<ProfileImage> profileImage;
  final String nickname;
  final dynamic secondBreedMixed;
  /// final String biography;
  /// final String furLength enum and static multi-language Short, Medium, Long;
  /// final String maturitySize enum and static multi-language Small, Medium, Large, Extra_Large;
  /// final Breed breed - Fetch from backend passing the language and also get the ML breed recognition;
  /// final String secondColor enum and static multi-language;

  NewPetFormButtonPressed(
    this.name,
    this.hasBeenVaccinated,
    this.hasBeenDewormed,
    this.hasBeenSterilizedSpayed,
    this.isLookingForMatch,
    this.isGuideDog,
    this.hasMicrochip,
    this.color,
    this.age,
    this.birthdate,
    this.profileImage,
    this.nickname,
    this.secondBreedMixed,
    this.type,
    this.sex,
    /// this.biography,
    /// this.furLength,
    /// this.maturitySize,
    /// this.breed,
    /// this.secondColor,
   );
}