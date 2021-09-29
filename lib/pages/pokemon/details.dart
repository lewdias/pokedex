import 'package:flutter/material.dart';
import 'package:pokedex_4fun/modules/pokemon/details/widgets/pokemon_header.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_info.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_type.dart';
import 'package:pokedex_4fun/modules/pokemon/details/widgets/pokemon_accent_circle.dart';
import 'package:pokedex_4fun/modules/pokemon/details/widgets/tabbar/content/pokemon_tabbar_content.dart';
import 'package:pokedex_4fun/modules/pokemon/details/widgets/tabbar/pokemon_tabbar.dart';
import 'package:pokedex_4fun/pages/widgets/custom_appbar.dart';
import 'package:pokedex_4fun/pages/widgets/pokemon_avatar.dart';

class PokemonDetailsPage extends StatelessWidget {
  final PokemonInfo pokemon;
  final PokemonTypeColors typeColors;

  PokemonDetailsPage({
    Key? key,
    required this.pokemon,
    required this.typeColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          backgroundColor: typeColors.defaultColor,
          opacity: 0.1,
          iconColor: Colors.white,
        ),
        body: Container(
          child: Scaffold(
            body: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  color: typeColors.defaultColor.withOpacity(0.8),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                PokemonHeader(pokemon: pokemon),
                PokemonAccentCircle(typeColors: typeColors),
                PokemonTabBar(typeColors: typeColors),
                PokemonAvatar(
                  sprite: pokemon.sprites.other?.officialArtwork.frontDefault,
                ),
                PokemonTabbarContent(pokemon: pokemon),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
