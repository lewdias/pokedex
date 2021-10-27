import 'package:pokedex_4fun/modules/pokemon/details/models/effect_entries.dart';
import 'package:pokedex_4fun/modules/pokemon/details/models/flavor_text.dart';
import 'package:pokedex_4fun/utils/humanize.dart';

class PokemonMoves {
  int id;
  String name;
  String type;
  String damageClass;
  List<EffectEntries> effects;
  List<FlavorText> flavorText;

  PokemonMoves({
    required this.id,
    required this.name,
    required this.type,
    required this.damageClass,
    required this.effects,
    required this.flavorText,
  });

  factory PokemonMoves.fromJson(Map<String, dynamic> json) {
    return PokemonMoves(
      id: json['id'],
      name: humanize(json['name']),
      type: json['type']['name'],
      damageClass: json['damage_class']['name'],
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
