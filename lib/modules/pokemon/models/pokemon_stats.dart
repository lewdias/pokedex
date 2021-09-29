class PokemonStats {
  int baseStat;
  int ev;
  PokemonStat stat;

  PokemonStats({
    required this.baseStat,
    required this.ev,
    required this.stat,
  });

  factory PokemonStats.fromJson(Map<String, dynamic> json) {
    return PokemonStats(
      baseStat: json['base_stat'],
      ev: json['effort'],
      stat: PokemonStat.fromJson(json['stat']),
    );
  }
}

class PokemonStat {
  String name;
  String url;

  PokemonStat({
    required this.name,
    required this.url,
  });

  factory PokemonStat.fromJson(Map<String, dynamic> json) {
    return PokemonStat(
      name: json['name'],
      url: json['url'],
    );
  }
}
