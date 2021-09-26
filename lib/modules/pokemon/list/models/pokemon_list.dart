import 'package:pokedex_4fun/modules/pokemon/list/models/pokemon_sprites.dart';
import 'package:pokedex_4fun/modules/pokemon/list/models/pokemon_type.dart';
import 'package:pokedex_4fun/utils/capitalize.dart';

class PokemonList {
  String id;
  String name;
  String url;
  List<PokemonType> types;
  PokemonSprites sprites;

  PokemonList({
    required this.id,
    required this.name,
    required this.url,
    required this.types,
    required this.sprites,
  });

  factory PokemonList.fromJson(
    Map<String, dynamic> json,
    Map<String, dynamic> sprites,
    List<dynamic> types,
    int id,
  ) {
    return PokemonList(
      name: capitalize(json['name']),
      url: json['url'],
      id: id.toString().padLeft(3, '0'),
      types: types.map((dynamic type) => PokemonType.fromJson(type)).toList(),
      sprites: PokemonSprites.fromJson(sprites),
    );
  }
}
