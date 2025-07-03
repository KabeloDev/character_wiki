import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Episode/epsiode_bloc.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Episode/epsiode_state.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Episode/characters_from_episode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Episodes')),
      body: BlocBuilder<EpisodeBloc, EpisodeState>(
        builder: (context, state) {
          if (state is EpisodeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is EpisodeLoaded) {
            final episodes = state.episodes;
            return ListView.builder(
              itemCount: episodes.length,
              itemBuilder: (context, index) {
                final episode = episodes[index];
                return ExpansionTile(
                  title: Text(episode.name),
                  subtitle: Text('${episode.episode} • Aired on: ${episode.airDate}'),
                  children: [
                    CharactersFromEpisodeScreen(characterUrls: episode.characters),
                  ],
                );
              },
            );
          } else if (state is EpisodeError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
