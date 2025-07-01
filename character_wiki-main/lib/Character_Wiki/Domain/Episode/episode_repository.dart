import 'episode.dart';

abstract class EpisodeRepository {
  Future<List<Episode>> getEpisodes();
}
