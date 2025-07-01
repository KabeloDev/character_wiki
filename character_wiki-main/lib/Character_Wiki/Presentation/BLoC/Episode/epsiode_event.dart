import 'package:equatable/equatable.dart';

abstract class EpisodeEvent extends Equatable {
  const EpisodeEvent();

  @override
  List<Object?> get props => [];
}

class FetchEpisodes extends EpisodeEvent {}
