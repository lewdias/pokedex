class PokemonAbilities {
  int id;
  List<PokemonAbilityNames> names;
  List<PokemonAbilityEffects> effects;
  List<PokemonFlavorText> flavorText;

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
          .map<PokemonAbilityEffects>((dynamic effectEntry) =>
              PokemonAbilityEffects.fromJson(effectEntry))
          .toList(),
      flavorText: json['flavor_text_entries']
          .map<PokemonFlavorText>((dynamic flavorTextEntry) =>
              PokemonFlavorText.fromJson(flavorTextEntry))
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

class PokemonAbilityEffects {
  String effect;
  String shortEffect;
  String language;

  PokemonAbilityEffects({
    required this.effect,
    required this.shortEffect,
    required this.language,
  });

  factory PokemonAbilityEffects.fromJson(Map<String, dynamic> json) {
    return PokemonAbilityEffects(
      effect: json['effect'],
      shortEffect: json['short_effect'],
      language: json['language']['name'],
    );
  }
}

class PokemonFlavorText {
  String flavorText;
  String language;

  PokemonFlavorText({
    required this.flavorText,
    required this.language,
  });

  factory PokemonFlavorText.fromJson(Map<String, dynamic> json) {
    return PokemonFlavorText(
      flavorText: json['flavor_text'],
      language: json['language']['name'],
    );
  }
}
