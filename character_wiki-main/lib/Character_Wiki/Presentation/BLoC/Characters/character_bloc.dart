import 'package:bloc/bloc.dart';
import 'package:character_wiki/Character_Wiki/Domain/Character/get_characters.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Characters/character_event.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Characters/character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacters getCharacters;

  CharacterBloc(this.getCharacters) : super(CharacterInitial()) {
    on<FetchCharacters>((event, emit) async {
      emit(CharacterLoading());
      try {
        final characters = await getCharacters(
          page: event.page,
          name: event.name,
          status: event.status,
          species: event.species,
          gender: event.gender,
        );
        emit(CharacterLoaded(characters));
      } catch (e) {
        emit(CharacterError(e.toString()));
      }
    });

    on<SearchCharacters>((event, emit) async {
      emit(CharacterLoading());
      try {
        final characters = await getCharacters();
        final filtered = characters
            .where(
              (c) => c.name.toLowerCase().contains(event.query.toLowerCase()),
            )
            .toList();
        emit(CharacterLoaded(filtered));
      } catch (e) {
        emit(CharacterError(e.toString()));
      }
    });

    on<FilterCharacters>((event, emit) async {
      emit(CharacterLoading());
      try {
        final characters = await getCharacters();
        final filtered = characters.where((c) {
          final matchesStatus =
              event.status == null || c.status == event.status;
          final matchesSpecies =
              event.species == null || c.species == event.species;
          final matchesGender =
              event.gender == null || c.gender == event.gender;
          return matchesStatus && matchesSpecies && matchesGender;
        }).toList();
        emit(CharacterLoaded(filtered));
      } catch (e) {
        emit(CharacterError(e.toString()));
      }
    });
  }
}
