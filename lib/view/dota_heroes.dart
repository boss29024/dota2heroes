import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroes/bloc/dota_heroes_bloc/dota_heroes_bloc.dart';

class DotaHeroes extends StatefulWidget {
  const DotaHeroes({super.key});

  @override
  State<DotaHeroes> createState() => _DotaHeroesState();
}

class _DotaHeroesState extends State<DotaHeroes> {
  @override
  @override
  void initState() {
    context.read<DotaHeroesBloc>().add(const GetDotaHeroesEvent());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dota2 Heroes"),
        backgroundColor: Colors.greenAccent,
      ),
      body: BlocConsumer<DotaHeroesBloc, DotaHeroesState>(
          listener: (context, state) {
        if (state.status == DotaHeroesStateStatus.isLoading) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Loading...')));
        } else if (state.status == DotaHeroesStateStatus.isLoaded) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Data loaded')));
        } else if (state.status == DotaHeroesStateStatus.isFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Failed to fetch data')));
        }
      }, builder: (context, state) {
        return ListView.builder(
          itemCount: state.heroesList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state.heroesList[index].localizedName ?? ''),
              subtitle: Text(state.heroesList[index].attackType ?? ''),
            );
          },
        );
      }),
    );
  }
}
