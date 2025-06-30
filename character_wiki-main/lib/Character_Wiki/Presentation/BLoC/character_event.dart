import 'package:equatable/equatable.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object?> get props => [];
}

class FetchCharacters extends CharacterEvent {
  final int page;
  final String? name;
  final String? status;
  final String? species;
  final String? gender;

  const FetchCharacters({
    this.page = 1,
    this.name,
    this.status,
    this.species,
    this.gender,
  });

  @override
  List<Object?> get props => [page, name, status, species, gender];
}
