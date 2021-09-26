import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:pokedex_4fun/modules/pokemon/list/models/pokemon_list.dart';
import 'package:pokedex_4fun/modules/pokemon/list/models/pokemon_type.dart';
import 'package:pokedex_4fun/modules/pokemon/list/widgets/pokemon_card_avatar.dart';
import 'package:pokedex_4fun/modules/pokemon/list/widgets/pokemon_card_name.dart';
import 'package:pokedex_4fun/modules/pokemon/list/widgets/pokemon_card_type.dart';
import 'package:pokedex_4fun/utils/hexcolor.dart';

Widget buildPokemonCard(BuildContext context, List<PokemonList>? pokemons) {
  if (pokemons != null) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final int numberOfCards = 2;
    final int cardHeight = 230;
    final double cardWidth =
        (screenWidth.toDouble() / numberOfCards.toDouble());

    return GridView.count(
      crossAxisCount: numberOfCards,
      childAspectRatio: (cardWidth / cardHeight),
      children: pokemons
          .map((PokemonList pokemon) => PokemonCard(pokemon: pokemon))
          .toList(),
    );
  }

  return ListView();
}

class PokemonCard extends StatelessWidget {
  final PokemonList pokemon;

  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PokemonTypeColors primaryPokemonTypeColors =
        pokemon.types.first.type.colors;

    return Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Card(
        color: getColorFromHex('${primaryPokemonTypeColors.lightColor}'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          onTap: () {
            print('${pokemon.types}');
          },
          splashColor:
              getColorFromHex('${primaryPokemonTypeColors.defaultColor}'),
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -50,
                child: Column(
                  children: [
                    PokemonCardAvatar(
                        officialArtwork: pokemon
                            .sprites.other?.officialArtwork.frontDefault),
                    PokemonCardName(
                        pokemonName: pokemon.name,
                        pokemonId: pokemon.id,
                        primaryPokemonTypeColors: primaryPokemonTypeColors),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: pokemon.types
                          .mapIndexed(
                            (int index, PokemonType type) => PokemonCardType(
                              pokemonType: type,
                              index: index,
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
