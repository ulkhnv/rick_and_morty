import 'package:equatable/equatable.dart';
import 'package:presentation/model/character_ui_model.dart';

abstract class CharacterState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  CharacterLoaded({required this.characters});

  final List<CharacterUIModel> characters;

  @override
  List<Object?> get props => [characters];
}
