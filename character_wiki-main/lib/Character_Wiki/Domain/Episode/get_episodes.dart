import 'episode.dart';
import 'episode_repository.dart';

class GetEpisodes {
  final EpisodeRepository repository;

  GetEpisodes(this.repository);

  Future<List<Episode>> call() => repository.getEpisodes();
}
