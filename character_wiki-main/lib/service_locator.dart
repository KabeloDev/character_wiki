import 'package:character_wiki/Character_Wiki/Data/Characters/character_remote_data_source.dart';
import 'package:character_wiki/Character_Wiki/Data/Episode/epsiode_remote_data_source.dart';
import 'package:character_wiki/Character_Wiki/Data/Location/location_remote_data_source.dart';
import 'package:character_wiki/Character_Wiki/Domain/Character/character_repository.dart';
import 'package:character_wiki/Character_Wiki/Domain/Character/character_repository_impl.dart';
import 'package:character_wiki/Character_Wiki/Domain/Character/get_characters.dart';
import 'package:character_wiki/Character_Wiki/Domain/Episode/episode_repository.dart';
import 'package:character_wiki/Character_Wiki/Domain/Episode/episode_repository_impl.dart';
import 'package:character_wiki/Character_Wiki/Domain/Episode/get_episodes.dart';
import 'package:character_wiki/Character_Wiki/Domain/Location/get_locations.dart';
import 'package:character_wiki/Character_Wiki/Domain/Location/location_repository.dart';
import 'package:character_wiki/Character_Wiki/Domain/Location/location_repository_impl.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Characters/character_bloc.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Episode/epsiode_bloc.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Location/location_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;


final sl = GetIt.instance;

void init() {
  // External
  sl.registerLazySingleton(() => http.Client());

  // Data sources
  sl.registerLazySingleton(() => CharacterRemoteDataSource(sl()));
  sl.registerLazySingleton(() => LocationRemoteDataSource(sl()));
  sl.registerLazySingleton(() => EpisodeRemoteDataSource(sl()));

  // Repositories
  sl.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(sl()));
  sl.registerLazySingleton<LocationRepository>(() => LocationRepositoryImpl(sl()));
  sl.registerLazySingleton<EpisodeRepository>(() => EpisodeRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetCharacters(sl()));
  sl.registerLazySingleton(() => GetLocations(sl()));
  sl.registerLazySingleton(() => GetEpisodes(sl()));

  // Blocs
  sl.registerFactory(() => CharacterBloc(sl()));
  sl.registerFactory(() => LocationBloc(sl()));
  sl.registerFactory(() => EpisodeBloc(sl()));
}
