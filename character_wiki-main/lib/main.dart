import 'package:character_wiki/Character_Wiki/Presentation/BLoC/character_bloc.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/character_event.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Home/home.dart';
import 'package:character_wiki/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  init(); // from service_locator.dart
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CharacterBloc>(),
      child: const AppRoot(),
    );
  }
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    // Dispatch fetch event after build
    return Builder(
      builder: (context) {
        context.read<CharacterBloc>().add(const FetchCharacters());

        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rick & Morty Wiki',
          home: Home(),
        );
      },
    );
  }
}
