import 'dart:convert';
import 'package:character_wiki/Character_Wiki/Data/character_model.dart';
import 'package:http/http.dart' as http;

class CharacterRemoteDataSource {
  final http.Client client;

  CharacterRemoteDataSource(this.client);

  Future<List<CharacterModel>> getCharacters({int page = 1, String? name, String? status, String? species, String? gender}) async {
    final queryParams = {
      'page': page.toString(),
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (species != null) 'species': species,
      if (gender != null) 'gender': gender,
    };

    final uri = Uri.https('rickandmortyapi.com', '/api/character', queryParams);

    final response = await client.get(Uri.parse(uri.toString()));

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final results = jsonBody['results'] as List;
      return results.map((e) => CharacterModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
