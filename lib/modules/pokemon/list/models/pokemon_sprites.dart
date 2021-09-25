class PokemonSprites {
  String backDefault;
  String backFemale;
  String backShiny;
  String backShinyFemale;
  String frontDefault;
  String frontFemale;
  String frontShiny;
  String frontShinyFemale;
  PokemonOtherSprites other;

  PokemonSprites({
    required this.backDefault,
    required this.backFemale,
    required this.backShiny,
    required this.backShinyFemale,
    required this.frontDefault,
    required this.frontFemale,
    required this.frontShiny,
    required this.frontShinyFemale,
    required this.other,
  });

  factory PokemonSprites.fromJson(Map<String, dynamic> json) {
    return PokemonSprites(
      backDefault: json['back_default'],
      backFemale: json['back_female'],
      backShiny: json['back_shiny'],
      backShinyFemale: json['back_shiny_female'],
      frontDefault: json['front_default'],
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'],
      frontShinyFemale: json['front_shiny_female'],
      other: json['other'].map(
        (dynamic otherSprites) => PokemonOtherSprites.fromJson(otherSprites),
      ),
    );
  }
}

class PokemonOtherSprites {
  OtherSpriteFrontDefault dreamWorld;
  OtherSpriteFrontDefault officialArtwork;

  PokemonOtherSprites({
    required this.dreamWorld,
    required this.officialArtwork,
  });

  factory PokemonOtherSprites.fromJson(Map<String, dynamic> json) {
    return PokemonOtherSprites(
      dreamWorld: json['dream_world'],
      officialArtwork: json['official-artwork'],
    );
  }
}

class OtherSpriteFrontDefault {
  String frontDefault;

  OtherSpriteFrontDefault({
    required this.frontDefault,
  });
}
