import 'package:pokedex_4fun/modules/pokemon/details/models/effect_entries.dart';
import 'package:pokedex_4fun/modules/pokemon/details/models/flavor_text.dart';
import 'package:pokedex_4fun/utils/humanize.dart';

class PokemonAbilities {
  int id;
  String name;
  List<EffectEntries> effects;
  List<FlavorText> flavorText;

  PokemonAbilities({
    required this.id,
    required this.name,
    required this.effects,
    required this.flavorText,
  });

  factory PokemonAbilities.fromJson(Map<String, dynamic> json) {
    return PokemonAbilities(
      id: json['id'],
      name: humanize(json['name']),
      effects: json['effect_entries']
          .map<EffectEntries>(
              (dynamic effectEntry) => EffectEntries.fromJson(effectEntry))
          .toList(),
      flavorText: json['flavor_text_entries']
          .map<FlavorText>(
              (dynamic flavorTextEntry) => FlavorText.fromJson(flavorTextEntry))
          .toList(),
    );
  }
}
