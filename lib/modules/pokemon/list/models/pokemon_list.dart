import 'package:pokedex_4fun/modules/pokemon/list/models/pokemon_type.dart';
import 'package:pokedex_4fun/utils/capitalize.dart';

class PokemonList {
  String id;
  String name;
  String url;
  String officialArtwork;
  List<PokemonType> types;

  PokemonList({
    required this.id,
    required this.name,
    required this.url,
    required this.officialArtwork,
    required this.types,
  });

  factory PokemonList.fromJson(Map<String, dynamic> json,
      String officialArtwork, List<dynamic> types, int id) {
    return PokemonList(
      name: capitalize(json['name']),
      url: json['url'],
      id: id.toString().padLeft(3, '0'),
      officialArtwork: officialArtwork,
      types: types.map((dynamic type) => PokemonType.fromJson(type)).toList(),
    );
  }
}
