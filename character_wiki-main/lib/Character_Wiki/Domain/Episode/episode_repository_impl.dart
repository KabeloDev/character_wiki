import 'package:character_wiki/Character_Wiki/Data/Episode/epsiode_remote_data_source.dart';
import 'package:character_wiki/Character_Wiki/Domain/Episode/episode.dart';
import 'package:character_wiki/Character_Wiki/Domain/Episode/episode_repository.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final EpisodeRemoteDataSource remoteDataSource;

  EpisodeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Episode>> getEpisodes() async {
    final models = await remoteDataSource.getEpisodes();
    return models
        .map(
          (model) => Episode(
            id: model.id,
            name: model.name,
            airDate: model.airDate,
            episode: model.episode,
            characters: model.characters,
          ),
        )
        .toList();
  }
}
