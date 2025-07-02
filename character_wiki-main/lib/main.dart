import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Characters/character_bloc.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Episode/epsiode_bloc.dart';
import 'package:character_wiki/Character_Wiki/Presentation/BLoC/Location/location_bloc.dart';
import 'package:character_wiki/Character_Wiki/Presentation/Home/home.dart';
import 'package:character_wiki/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  init(); 
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => sl<CharacterBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<LocationBloc>(),
        ),
        BlocProvider(
          create: (_) => sl<EpisodeBloc>(),
        ),
      ],
      child: const AppRoot(),
    );
  }
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rick & Morty Wiki',
          home: Home(),
        );
      },
    );
  }
}
