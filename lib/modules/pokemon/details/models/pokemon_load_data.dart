import 'package:pokedex_4fun/utils/humanize.dart';

class PokemonLoadData {
  String name;
  String url;
  bool? isExpanded;

  PokemonLoadData({
    required this.name,
    required this.url,
  });

  factory PokemonLoadData.fromJson(Map<String, dynamic> json) {
    return PokemonLoadData(
      name: humanize(json['name']),
      url: json['url'],
    );
  }
}
