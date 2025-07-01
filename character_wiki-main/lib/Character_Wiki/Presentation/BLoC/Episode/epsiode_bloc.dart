import 'package:bloc/bloc.dart';
import 'package:character_wiki/Character_Wiki/Domain/Episode/get_episodes.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Episode/epsiode_event.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Episode/epsiode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final GetEpisodes getEpisodes;

  EpisodeBloc(this.getEpisodes) : super(EpisodeInitial()) {
    on<FetchEpisodes>((event, emit) async {
      emit(EpisodeLoading());
      try {
        final episodes = await getEpisodes();
        emit(EpisodeLoaded(episodes));
      } catch (e) {
        emit(EpisodeError(e.toString()));
      }
    });
  }
}
