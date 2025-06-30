
import 'package:bloc/bloc.dart';
import 'package:character_wiki/Character_Wiki/Domain/get_characters.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/character_event.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/character_state.dart';

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
  }
}
