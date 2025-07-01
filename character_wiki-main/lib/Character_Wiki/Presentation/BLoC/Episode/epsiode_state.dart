import 'package:character_wiki/Character_Wiki/Domain/Episode/episode.dart';
import 'package:equatable/equatable.dart';

abstract class EpisodeState extends Equatable {
  const EpisodeState();

  @override
  List<Object?> get props => [];
}

class EpisodeInitial extends EpisodeState {}

class EpisodeLoading extends EpisodeState {}

class EpisodeLoaded extends EpisodeState {
  final List<Episode> episodes;

  const EpisodeLoaded(this.episodes);

  @override
  List<Object?> get props => [episodes];
}

class EpisodeError extends EpisodeState {
  final String message;

  const EpisodeError(this.message);

  @override
  List<Object?> get props => [message];
}
