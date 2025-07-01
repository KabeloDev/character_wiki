import 'location.dart';
import 'location_repository.dart';

class GetLocations {
  final LocationRepository repository;

  GetLocations(this.repository);

  Future<List<Location>> call() async {
    return await repository.getLocations();
  }
}
