import 'package:pokedex_4fun/modules/pokemon/details/models/pokemon_load_data.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_sprites.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_stats.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_type.dart';
import 'package:pokedex_4fun/utils/capitalize.dart';

class PokemonInfo {
  String id;
  String name;
  PokemonSprites sprites;
  List<PokemonType> types;
  List<PokemonLoadData> abilities;
  List<PokemonStats> stats;

  PokemonInfo({
    required this.id,
    required this.name,
    required this.types,
    required this.sprites,
    required this.abilities,
    required this.stats,
  });

  factory PokemonInfo.fromJson(Map<String, dynamic> json) {
    return PokemonInfo(
      id: json['id'].toString().padLeft(3, '0'),
      name: capitalize(json['name']),
      sprites: PokemonSprites.fromJson(json['sprites']),
      abilities: json['abilities']
          .map<PokemonLoadData>(
              (dynamic ability) => PokemonLoadData.fromJson(ability['ability']))
          .toList(),
      types: json['types']
          .map<PokemonType>((dynamic type) => PokemonType.fromJson(type))
          .toList(),
      stats: json['stats']
          .map<PokemonStats>((dynamic stat) => PokemonStats.fromJson(stat))
          .toList(),
    );
  }
}
