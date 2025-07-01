import 'dart:convert';
import 'package:http/http.dart' as http;
import 'location_model.dart';

class LocationRemoteDataSource {
  final http.Client client;

  LocationRemoteDataSource(this.client);

  Future<List<LocationModel>> getAllLocations() async {
    final uri = Uri.parse('https://rickandmortyapi.com/api/location');
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      final results = body['results'] as List;
      return results.map((e) => LocationModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load locations');
    }
  }
}
