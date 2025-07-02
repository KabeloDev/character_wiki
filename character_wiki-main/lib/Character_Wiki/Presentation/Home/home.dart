import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Characters/character_bloc.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Characters/character_event.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Characters/character_state.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Episode/epsiode_bloc.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Episode/epsiode_event.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Location/location_bloc.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Location/location_event.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Episode/episode.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Location/location.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();

  String? selectedStatus;
  String? selectedSpecies;
  String? selectedGender;

  @override
  void initState() {
    super.initState();
    context.read<CharacterBloc>().add(const FetchCharacters());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Rick & Morty Wiki')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Center(
                child: Text(
                  'Filters',
                  style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Characters', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: selectedStatus,
                    decoration: const InputDecoration(labelText: 'Status'),
                    items: ['Alive', 'Dead', 'Unknown']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) => setState(() => selectedStatus = val),
                  ),
                  DropdownButtonFormField<String>(
                    value: selectedSpecies,
                    decoration: const InputDecoration(labelText: 'Species'),
                    items: ['Human', 'Alien', 'Robot']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) => setState(() => selectedSpecies = val),
                  ),
                  DropdownButtonFormField<String>(
                    value: selectedGender,
                    decoration: const InputDecoration(labelText: 'Gender'),
                    items: ['Female', 'Male', 'Unknown']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) => setState(() => selectedGender = val),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CharacterBloc>().add(FilterCharacters(
                        status: selectedStatus,
                        species: selectedSpecies,
                        gender: selectedGender,
                      ));
                      Navigator.pop(context);
                    },
                    child: const Text('Apply Filters'),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedStatus = null;
                        selectedSpecies = null;
                        selectedGender = null;
                      });
                      context.read<CharacterBloc>().add(const FetchCharacters());
                      Navigator.pop(context);
                    },
                    child: const Text('Clear Filters'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: () {
                context.read<CharacterBloc>().add(const FetchCharacters());
              },
              child: const Text('Characters'),
            ),
            MaterialButton(
              onPressed: () {
                context.read<EpisodeBloc>().add(FetchEpisodes());
                Navigator.push(context, MaterialPageRoute(builder: (context) => const EpisodeScreen()));
              },
              child: const Text('Episodes'),
            ),
            MaterialButton(
              onPressed: () {
                context.read<LocationBloc>().add(FetchLocations());
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LocationScreen()));
              },
              child: const Text('Locations'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: 'Search...',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    final query = _searchController.text.trim();
                    if (query.isNotEmpty) {
                      context.read<CharacterBloc>().add(SearchCharacters(query));
                    }
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<CharacterBloc, CharacterState>(
                builder: (context, state) {
                  if (state is CharacterLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CharacterLoaded) {
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      itemCount: state.characters.length,
                      itemBuilder: (context, index) {
                        final character = state.characters[index];
                        return GestureDetector(
                          onTap: () {
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(character.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                color: Colors.black54,
                                padding: const EdgeInsets.all(6),
                                child: Text(
                                  character.name,
                                  style: const TextStyle(color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is CharacterError) {
                    return Center(child: Text('Error: ${state.message}'));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
