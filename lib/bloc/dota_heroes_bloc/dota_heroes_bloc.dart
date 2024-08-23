import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroes/services/dota_heroes_service.dart';
import 'package:equatable/equatable.dart';
import '../../models/heroes_model/hero_dota2.dart';

part 'dota_heroes_event.dart';
part 'dota_heroes_state.dart';

class DotaHeroesBloc extends Bloc<DotaHeroesEvent, DotaHeroesState> {
  final DotaHeroesService dotaHeroesService;

  DotaHeroesBloc({required this.dotaHeroesService})
      : super(const DotaHeroesState()) {
    on<GetDotaHeroesEvent>(getDotaHeroes);
  }
  Future<void> getDotaHeroes(
      GetDotaHeroesEvent event, Emitter<DotaHeroesState> emit) async {
    emit(state.copyWith(status: DotaHeroesStateStatus.isLoading));
    try {
      final heroesList = await dotaHeroesService.getHeroes();
      emit(state.copyWith(
        status: DotaHeroesStateStatus.isLoaded,
        heroesList: heroesList,
      ));
    } catch (e) {
      emit(state.copyWith(status: DotaHeroesStateStatus.isFailed));
    }
  }
}
