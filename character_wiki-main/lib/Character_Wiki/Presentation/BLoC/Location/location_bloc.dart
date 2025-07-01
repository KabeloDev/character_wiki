import 'package:character_wiki/Character_Wiki/Domain/Location/get_locations.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Location/location_event.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Location/location_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetLocations getLocations;

  LocationBloc(this.getLocations) : super(LocationInitial()) {
    on<FetchLocations>(_onFetchLocations);
  }

  Future<void> _onFetchLocations(
      FetchLocations event, Emitter<LocationState> emit) async {
    emit(LocationLoading());
    try {
      final locations = await getLocations();
      emit(LocationLoaded(locations));
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }
}
