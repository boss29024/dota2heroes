part of 'dota_heroes_bloc.dart';

enum DotaHeroesStateStatus { initState, isLoading, isLoaded, isFailed }

final class DotaHeroesState extends Equatable {
  final DotaHeroesStateStatus status;
  final List<Hero> heroesList;

  const DotaHeroesState(
      {this.status = DotaHeroesStateStatus.initState,
      this.heroesList = const []});
  DotaHeroesState copyWith(
      {DotaHeroesStateStatus? status, List<Hero>? heroesList}) {
    return DotaHeroesState(
        status: status ?? this.status,
        heroesList: heroesList ?? this.heroesList);
  }

  @override
  List<Object?> get props => [status, heroesList];
}
