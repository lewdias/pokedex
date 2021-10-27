import 'dart:convert';

import 'package:pokedex_4fun/config/constants/cache_keys.dart';
import 'package:pokedex_4fun/config/api/getFromCacheOrApi.dart';
import 'package:pokedex_4fun/modules/pokemon/details/models/pokemon_moves.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonMovesRepository {
  Future<PokemonMoves> getMoves(String url) async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      Map<dynamic, dynamic> responseMapped = await getFromCacheOrApi(
          url, CacheKeys.pokemonMove(url), sharedPreferences,
          getFromCache: false);

      int statusCode = responseMapped['statusCode'];
      final data = responseMapped['data'];
      final cachedResponse = responseMapped['cachedResponse'];

      if (statusCode == 200) {
        if (cachedResponse == false) {
          Map<String, dynamic> responseMap = {
            'data': {
              'id': data['id'],
              'type': data['type'],
              'name': data['name'],
              'damageClass': data['damage_class'],
              'effect_entries': data['effect_entries'],
              'flavor_text_entries': data['flavor_text_entries'],
            },
            'statusCode': 200,
          };
          String rawJson = jsonEncode(responseMap);
          sharedPreferences.setString(CacheKeys.pokemonMove(url), rawJson);
        }
        return PokemonMoves.fromJson(data);
      } else {
        throw "Failed!";
      }
    } catch (e) {
      throw e;
    }
  }
}
