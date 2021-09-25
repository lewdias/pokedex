class PokemonType {
  int slot;
  PokemonTypeProperties type;

  PokemonType({
    required this.slot,
    required this.type,
  });

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      slot: json['slot'],
      type: PokemonTypeProperties.fromJson(json['type']),
    );
  }
}

class PokemonTypeProperties {
  String name;
  String url;

  PokemonTypeProperties({
    required this.name,
    required this.url,
  });

  factory PokemonTypeProperties.fromJson(Map<String, dynamic> type) {
    return PokemonTypeProperties(
      name: type['name'],
      url: type['url'],
    );
  }
}
