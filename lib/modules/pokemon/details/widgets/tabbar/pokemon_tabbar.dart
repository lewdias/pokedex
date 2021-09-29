import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_type.dart';
import 'package:pokedex_4fun/utils/hexcolor.dart';

class PokemonTabBar extends StatelessWidget {
  final PokemonTypeColors typeColors;

  const PokemonTabBar({Key? key, required this.typeColors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 335,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: AppBar(
          primary: false,
          toolbarHeight: 1,
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            labelColor: Colors.black,
            indicatorColor: getColorFromHex('${typeColors.defaultColor}'),
            labelStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w800),
            unselectedLabelStyle:
                GoogleFonts.montserrat(fontWeight: FontWeight.w400),
            tabs: [
              Tab(
                text: 'Base Stats',
              ),
              Tab(
                text: 'Evolution',
              ),
              Tab(
                text: 'Moves',
              ),
            ],
          ),
        ),
      ),
    );
  }
}