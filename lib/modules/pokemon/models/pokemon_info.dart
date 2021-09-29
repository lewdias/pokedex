import 'package:pokedex_4fun/modules/pokemon/models/pokemon_sprites.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_stats.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_type.dart';
import 'package:pokedex_4fun/utils/capitalize.dart';

class PokemonInfo {
  String id;
  String name;
  List<PokemonType> types;
  PokemonSprites sprites;
  List<PokemonStats> stats;

  PokemonInfo({
    required this.id,
    required this.name,
    required this.types,
    required this.sprites,
    required this.stats,
  });

  factory PokemonInfo.fromJson(Map<String, dynamic> json) {
    return PokemonInfo(
      name: capitalize(json['name']),
      id: json['id'].toString().padLeft(3, '0'),
      types: json['types']
          .map<PokemonType>((dynamic type) => PokemonType.fromJson(type))
          .toList(),
      sprites: PokemonSprites.fromJson(json['sprites']),
      stats: json['stats']
          .map<PokemonStats>((dynamic stat) => PokemonStats.fromJson(stat))
          .toList(),
    );
  }
}
