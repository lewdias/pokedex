import 'package:pokedex_4fun/config/constants/api_constants.dart' as constants;

class APIPath {
  static String getOficialArtwork(String id) =>
      '${constants.SPRITES_URL}/other/official-artwork/$id.png';

  static String getPokemons(int limit, int offset) =>
      '${constants.POKEAPI_URL}/pokemon/?limit=$limit&offset=$offset';

  static String getPokemon(String id) => '${constants.POKEAPI_URL}/pokemon/$id';
}
