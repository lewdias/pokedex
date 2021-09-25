import 'dart:convert';
import 'package:pokedex_4fun/config/constants/cache_keys.dart';
import 'package:pokedex_4fun/modules/pokemon/list/models/pokemon_list.dart';
import 'package:pokedex_4fun/config/constants/api_path.dart';
import 'package:pokedex_4fun/utils/getFromCacheOrApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonListRepository {
  Future<List<PokemonList>> getPokemons(int limit, int offset) async {
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

        List<PokemonList> pokemonList = await Future.wait(
            handlePokemonListResults(results, sharedPreferences));

        return pokemonList;
      } else {
        return [];
      }
    } catch (e) {
      throw e;
    }
  }

  List<Future<PokemonList>> handlePokemonListResults(
      dynamic results, SharedPreferences sharedPreferences) {
    List<Future<PokemonList>> pokemons =
        results.map<Future<PokemonList>>((dynamic item) async {
      String pokemonUrl = item['url'];

      Map<dynamic, dynamic> responseMapped = await getFromCacheOrApi(pokemonUrl,
          CacheKeys.pokemonInformation(item['name']), sharedPreferences);

      int statusCode = responseMapped['statusCode'];
      final pokemonInfo = responseMapped['data'];
      final cachedPokemonInfo = responseMapped['cachedResponse'];

      if (statusCode == 200) {
        final types = pokemonInfo['types'];
        final id = pokemonInfo['id'];

        String officialArtwork = pokemonInfo['sprites']['other']
            ['official-artwork']['front_default'];

        if (cachedPokemonInfo == false) {
          Map<String, dynamic> responseMap = {
            'data': {
              'id': pokemonInfo['id'],
              'types': pokemonInfo['types'],
              'sprites': {
                'other': {
                  'official-artwork': {
                    'front_default': officialArtwork,
                  },
                },
              },
            },
            'statusCode': 200,
          };
          String rawJson = jsonEncode(responseMap);
          sharedPreferences.setString(
              CacheKeys.pokemonInformation(item['name']), rawJson);
        }

        PokemonList pokemonList =
            PokemonList.fromJson(item, officialArtwork, types, id);

        return pokemonList;
      } else {
        return PokemonList.fromJson(item, '', [], 0);
      }
    }).toList();

    return pokemons;
  }
}
