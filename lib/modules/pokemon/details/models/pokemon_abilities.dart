import 'package:pokedex_4fun/modules/pokemon/details/models/effect_entries.dart';
import 'package:pokedex_4fun/modules/pokemon/details/models/flavor_text.dart';

class PokemonAbilities {
  int id;
  List<PokemonAbilityNames> names;
  List<EffectEntries> effects;
  List<FlavorText> flavorText;

  PokemonAbilities({
    required this.id,
    required this.names,
    required this.effects,
    required this.flavorText,
  });

  factory PokemonAbilities.fromJson(Map<String, dynamic> json) {
    return PokemonAbilities(
      id: json['id'],
      names: json['names']
          .map<PokemonAbilityNames>(
              (dynamic name) => PokemonAbilityNames.fromJson(name))
          .toList(),
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

class PokemonAbilityNames {
  String name;
  String language;

  PokemonAbilityNames({
    required this.name,
    required this.language,
  });

  factory PokemonAbilityNames.fromJson(Map<String, dynamic> json) {
    return PokemonAbilityNames(
      name: json['name'],
      language: json['language']['name'],
    );
  }
}
