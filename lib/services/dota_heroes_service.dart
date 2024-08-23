import 'dart:async';

import 'package:heroes/models/heroes_model/hero_dota2.dart';

abstract class DotaHeroesService {
  FutureOr<List<Hero>> getHeroes();
}
