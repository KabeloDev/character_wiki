import 'package:character_wiki/Character_Wiki/Data/Characters/character_remote_data_source.dart';
import 'package:character_wiki/Character_Wiki/Domain/Character/character_repository.dart';
import 'package:character_wiki/Character_Wiki/Domain/Character/character_repository_impl.dart';
import 'package:character_wiki/Character_Wiki/Domain/Character/get_characters.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Characters/character_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;


final sl = GetIt.instance;

void init() {
  // External
  sl.registerLazySingleton(() => http.Client());

  // Data sources
  sl.registerLazySingleton(() => CharacterRemoteDataSource(sl()));

  // Repositories
  sl.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetCharacters(sl()));

  // Blocs
  sl.registerFactory(() => CharacterBloc(sl()));
}
