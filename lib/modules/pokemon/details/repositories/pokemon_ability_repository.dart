import 'dart:convert';

import 'package:pokedex_4fun/config/constants/cache_keys.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_abilities.dart';
import 'package:pokedex_4fun/utils/getFromCacheOrApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonAbilityRepository {
  Future<PokemonAbilities> getAbilities(String url) async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      Map<dynamic, dynamic> responseMapped = await getFromCacheOrApi(
          url, CacheKeys.pokemonAbility(url), sharedPreferences,
          getFromCache: false);

      int statusCode = responseMapped['statusCode'];
      final data = responseMapped['data'];
      final cachedResponse = responseMapped['cachedResponse'];

      if (statusCode == 200) {
        if (cachedResponse == false) {
          Map<String, dynamic> responseMap = {
            'data': {
              'id': data['id'],
              'effect_entries': data['effect_entries'],
              'flavor_text_entries': data['flavor_text_entries'],
            },
            'statusCode': 200,
          };
          String rawJson = jsonEncode(responseMap);
          sharedPreferences.setString(CacheKeys.pokemonAbility(url), rawJson);
        }
        return PokemonAbilities.fromJson(data);
      } else {
        throw "Failed!";
      }
    } catch (e) {
      throw e;
    }
  }
}
