import 'dart:convert';
import 'package:http/http.dart' as http;
import 'episode_model.dart';

class EpisodeRemoteDataSource {
  final http.Client client;

  EpisodeRemoteDataSource(this.client);

  Future<List<EpisodeModel>> getEpisodes() async {
    final uri = Uri.parse('https://rickandmortyapi.com/api/episode');
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final results = jsonBody['results'] as List;
      return results.map((e) => EpisodeModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load episodes');
    }
  }
}
