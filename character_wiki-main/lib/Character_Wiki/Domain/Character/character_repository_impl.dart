import 'package:character_wiki/Character_Wiki/Data/Characters/character_remote_data_source.dart';
import 'package:character_wiki/Character_Wiki/Domain/Character/character.dart';
import 'package:character_wiki/Character_Wiki/Domain/Character/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;

  CharacterRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Character>> getCharacters({int page = 1, String? name, String? status, String? species, String? gender}) async {
    final models = await remoteDataSource.getCharacters(
      page: page,
      name: name,
      status: status,
      species: species,
      gender: gender,
    );

    return models.map((model) => Character(
      id: model.id,
      name: model.name,
      status: model.status,
      species: model.species,
      gender: model.gender,
      image: model.image,
      origin: model.origin,
      location: model.location,
      episodes: model.episodes,
    )).toList();
  }
}
