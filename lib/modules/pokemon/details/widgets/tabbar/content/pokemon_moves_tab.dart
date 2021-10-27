import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_4fun/modules/pokemon/details/models/pokemon_moves.dart';
import 'package:pokedex_4fun/modules/pokemon/details/repositories/pokemon_moves_repository.dart';
import 'package:pokedex_4fun/modules/pokemon/details/widgets/tabbar/content/content_height.dart';
import 'package:pokedex_4fun/modules/pokemon/details/models/pokemon_load_data.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_type.dart';
import 'package:pokedex_4fun/pages/widgets/fonts/primary_font.dart';
import 'package:pokedex_4fun/pages/widgets/fonts/secondary_font.dart';
import 'package:provider/provider.dart';

class PokemonMovesTab extends StatefulWidget {
  final List<PokemonLoadData> moves;
  final PokemonTypeColors typeColors;
  const PokemonMovesTab(
      {Key? key, required this.moves, required this.typeColors})
      : super(key: key);

  @override
  State<PokemonMovesTab> createState() => _PokemonMovesState();
}

class _PokemonMovesState extends State<PokemonMovesTab> {
  List<PokemonMoves> pokemonMoves = [];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final pokemonMovesRepository = Provider.of<PokemonMovesRepository>(context);

    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(minHeight: screenHeight * contentHeight),
        color: Colors.white,
        child: Column(
          children: widget.moves.mapIndexed((int index, PokemonLoadData move) {
            int moveId = int.parse(move.url.split('/')[6]);

            PokemonMoves? currentMove =
                pokemonMoves.firstWhereOrNull((element) {
              return element.id == moveId;
            });

            return ExpansionTile(
              title: PrimaryFont(text: move.name),
              leading: Icon(Icons.offline_bolt,
                  color: widget.typeColors.defaultColor),
              iconColor: widget.typeColors.defaultColor,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  title: currentMove != null
                      ? SecondaryFont(
                          text: currentMove.effects
                              .firstWhere((effect) => effect.language == 'en')
                              .effect,
                        )
                      : Center(
                          child: CircularProgressIndicator(
                            color: widget.typeColors.defaultColor,
                          ),
                        ),
                ),
              ],
              onExpansionChanged: (bool expanded) async {
                if (expanded == true) {
                  PokemonMoves pokemonMovesData =
                      await pokemonMovesRepository.getMoves(move.url);

                  setState(() {
                    pokemonMoves = [...pokemonMoves, pokemonMovesData];
                  });
                } else {
                  List<PokemonMoves> pokemonMovesCopy = [...pokemonMoves];

                  if (pokemonMovesCopy.length != 0) {
                    if (pokemonMovesCopy.contains(currentMove))
                      pokemonMovesCopy.removeWhere(
                          (currentMove) => currentMove.id == moveId);

                    setState(() {
                      pokemonMoves = pokemonMovesCopy;
                    });
                  }
                }
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
