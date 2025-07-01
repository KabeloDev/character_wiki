

import 'package:character_wiki/Character_Wiki/Data/Location/location_remote_data_source.dart';
import 'package:character_wiki/Character_Wiki/Domain/Location/location.dart';
import 'package:character_wiki/Character_Wiki/Domain/Location/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;

  LocationRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Location>> getLocations() async {
    final models = await remoteDataSource.getAllLocations();

    return models.map((model) => Location(
      id: model.id,
      name: model.name,
      type: model.type,
      dimension: model.dimension,
      residents: model.residents,
    )).toList();
  }
}
