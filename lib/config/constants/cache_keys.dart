class CacheKeys {
  static String pokemonList(int limit, int offset) =>
      'pokemon-list-$limit-$offset';
  static String pokemonInformation(String pokemonName) =>
      'pokemon-info-$pokemonName';
  static String pokemonAbility(String url) => 'pokemon-ability-$url';
  static String pokemonMove(String url) => 'pokemon-move-$url';
}
