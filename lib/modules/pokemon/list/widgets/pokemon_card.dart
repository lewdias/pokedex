import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:pokedex_4fun/modules/pokemon/details/repositories/pokemon_ability_repository.dart';
import 'package:pokedex_4fun/modules/pokemon/details/repositories/pokemon_moves_repository.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_info.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_type.dart';
import 'package:pokedex_4fun/modules/pokemon/list/widgets/pokemon_card_avatar.dart';
import 'package:pokedex_4fun/modules/pokemon/list/widgets/pokemon_card_name.dart';
import 'package:pokedex_4fun/modules/pokemon/list/widgets/pokemon_card_type.dart';
import 'package:pokedex_4fun/pages/pokemon/details.dart';
import 'package:provider/provider.dart';

Widget buildPokemonCard(BuildContext context, List<PokemonInfo>? pokemons) {
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
          .map((PokemonInfo pokemon) => PokemonCard(pokemon: pokemon))
          .toList(),
    );
  }

  return ListView();
}

class PokemonCard extends StatelessWidget {
  final PokemonInfo pokemon;

  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final PokemonTypeColors primaryPokemonTypeColors =
        pokemon.types.first.type.colors;

    return Container(
      margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
      child: Card(
        elevation: 0,
        color: primaryPokemonTypeColors.defaultColor.withOpacity(0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MultiProvider(
                  providers: [
                    Provider(create: (_) => PokemonAbilityRepository()),
                    Provider(create: (_) => PokemonMovesRepository()),
                  ],
                  child: PokemonDetailsPage(
                      pokemon: pokemon, typeColors: primaryPokemonTypeColors),
                ),
              ),
            );
          },
          splashColor: primaryPokemonTypeColors.lightColor,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -50,
                child: Column(
                  children: [
                    PokemonCardAvatar(
                        sprite: pokemon
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
