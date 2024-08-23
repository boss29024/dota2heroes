import 'dart:async';

import 'package:dio/dio.dart';
import 'package:heroes/models/heroes_model/hero_dota2.dart';
import 'package:heroes/services/dota_heroes_service.dart';

class DotaHeroesServiceImpl implements DotaHeroesService {
  final dio = Dio();
  @override
  FutureOr<List<Hero>> getHeroes() async {
    final response = await dio.get('https://api.opendota.com/api/heroes');
    List<Hero> heroes =
        (response.data as List).map((item) => Hero.fromJson(item)).toList();
    return heroes;
  }
}
