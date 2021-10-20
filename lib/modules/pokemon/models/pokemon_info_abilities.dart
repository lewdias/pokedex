import 'package:pokedex_4fun/utils/humanize.dart';

class PokemonInfoAbilities {
  String name;
  String url;
  bool? isExpanded;

  PokemonInfoAbilities({
    required this.name,
    required this.url,
  });

  factory PokemonInfoAbilities.fromJson(Map<String, dynamic> json) {
    return PokemonInfoAbilities(
      name: humanize(json['name']),
      url: json['url'],
    );
  }
}
