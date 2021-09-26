import 'dart:convert';
import 'package:pokedex_4fun/config/constants/cache_keys.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_info.dart';
import 'package:pokedex_4fun/config/constants/api_path.dart';
import 'package:pokedex_4fun/utils/getFromCacheOrApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonListRepository {
  Future<List<PokemonInfo>> getPokemons(int limit, int offset) async {
    try {
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      Map<dynamic, dynamic> responseMapped = await getFromCacheOrApi(
          APIPath.getPokemons(limit, offset),
          CacheKeys.pokemonList(limit, offset),
          sharedPreferences);

      int statusCode = responseMapped['statusCode'];
      final data = responseMapped['data'];
      final cachedResponse = responseMapped['cachedResponse'];

      if (statusCode == 200) {
        final results = data['results'];

        if (cachedResponse == false) {
          Map<String, dynamic> responseMap = {
            'data': {
              'count': data['count'],
              'next': data['next'],
              'previous': data['previous'],
              'results': data['results'],
            },
            'statusCode': 200,
          };
          String rawJson = jsonEncode(responseMap);
          sharedPreferences.setString(
              CacheKeys.pokemonList(limit, offset), rawJson);
        }

        List<PokemonInfo> pokemonList = await Future.wait(
            handlePokemonListResults(results, sharedPreferences));

        return pokemonList;
      } else {
        return [];
      }
    } catch (e) {
      throw e;
    }
  }

  List<Future<PokemonInfo>> handlePokemonListResults(
      dynamic results, SharedPreferences sharedPreferences) {
    List<Future<PokemonInfo>> pokemons =
        results.map<Future<PokemonInfo>>((dynamic item) async {
      String pokemonUrl = item['url'];

      Map<dynamic, dynamic> responseMapped = await getFromCacheOrApi(pokemonUrl,
          CacheKeys.pokemonInformation(item['name']), sharedPreferences);

      int statusCode = responseMapped['statusCode'];
      final pokemonInfo = responseMapped['data'];
      final cachedPokemonInfo = responseMapped['cachedResponse'];

      if (statusCode == 200) {
        if (cachedPokemonInfo == false) {
          Map<String, dynamic> responseMap = {
            'data': {
              'id': pokemonInfo['id'],
              'types': pokemonInfo['types'],
              'sprites': pokemonInfo['sprites'],
              'name': pokemonInfo['name'],
            },
            'statusCode': 200,
          };
          String rawJson = jsonEncode(responseMap);
          sharedPreferences.setString(
              CacheKeys.pokemonInformation(item['name']), rawJson);
        }

        PokemonInfo pokemonList = PokemonInfo.fromJson(pokemonInfo);

        return pokemonList;
      } else {
        return PokemonInfo.fromJson({});
      }
    }).toList();

    return pokemons;
  }
}
