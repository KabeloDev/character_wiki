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

class SearchCharacters extends CharacterEvent {
  final String query;

  const SearchCharacters(this.query);

  @override
  List<Object> get props => [query];
}

class FilterCharacters extends CharacterEvent {
  final String? status;
  final String? species;
  final String? gender;

  const FilterCharacters({this.status, this.species, this.gender});

  @override
  List<Object?> get props => [status, species, gender];
}
