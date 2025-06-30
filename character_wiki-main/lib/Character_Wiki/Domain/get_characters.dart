import 'package:character_wiki/Character_Wiki/Domain/character.dart';
import 'package:character_wiki/Character_Wiki/Domain/character_repository.dart';

class GetCharacters {
  final CharacterRepository repository;

  GetCharacters(this.repository);

  Future<List<Character>> call({int page = 1, String? name, String? status, String? species, String? gender}) {
    return repository.getCharacters(
      page: page,
      name: name,
      status: status,
      species: species,
      gender: gender,
    );
  }
}
