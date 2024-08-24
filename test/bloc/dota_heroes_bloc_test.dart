import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:heroes/bloc/dota_heroes_bloc/dota_heroes_bloc.dart';
import 'package:heroes/services/dota_heroes_service.dart';
import 'package:heroes/services/dota_heroes_service_impl.dart';

void main() {
  late DotaHeroesBloc dotaHeroesBloc;
  late DotaHeroesService dotaHeroesService;

  setUp(() {
    dotaHeroesService = DotaHeroesServiceImpl();
    dotaHeroesBloc = DotaHeroesBloc(dotaHeroesService: dotaHeroesService);
  });

  group('DotaHeroesBloc', () {
    blocTest(
      'emits [] when nothing is added',
      build: () => dotaHeroesBloc,
      expect: () => [],
    );

    blocTest(
      'get data',
      build: () => dotaHeroesBloc,
      act: (bloc) {
        return bloc.add(const GetDotaHeroesEvent());
      },
      expect: () => [dotaHeroesBloc.state],
    );
  });
}
