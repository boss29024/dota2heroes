import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroes/bloc/dota_heroes_bloc/dota_heroes_bloc.dart';
import 'package:heroes/services/dota_heroes_service_impl.dart';
import 'package:heroes/view/dota_heroes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) =>
            DotaHeroesBloc(dotaHeroesService: DotaHeroesServiceImpl()),
        child: const DotaHeroes(),
      ),
    );
  }
}
