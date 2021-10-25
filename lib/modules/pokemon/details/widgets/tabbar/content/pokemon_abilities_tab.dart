import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_4fun/modules/pokemon/details/widgets/tabbar/content/content_height.dart';
import 'package:pokedex_4fun/modules/pokemon/details/repositories/pokemon_ability_repository.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_abilities.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_info_abilities.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_type.dart';
import 'package:provider/provider.dart';

class PokemonAbilitiesTab extends StatefulWidget {
  final List<PokemonInfoAbilities> abilities;
  final PokemonTypeColors typeColors;
  const PokemonAbilitiesTab(
      {Key? key, required this.abilities, required this.typeColors})
      : super(key: key);

  @override
  State<PokemonAbilitiesTab> createState() => _PokemonAbilitiesState();
}

class _PokemonAbilitiesState extends State<PokemonAbilitiesTab> {
  List<PokemonAbilities> pokemonAbilities = [];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final pokemonAbilitiesRepository =
        Provider.of<PokemonAbilityRepository>(context);

    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(minHeight: screenHeight * contentHeight),
        color: Colors.white,
        child: Column(
          children: widget.abilities
              .mapIndexed((int index, PokemonInfoAbilities ability) {
            int abilityId = int.parse(ability.url.split('/')[6]);

            PokemonAbilities? currentAbility =
                pokemonAbilities.firstWhereOrNull((ab) {
              return ab.id == abilityId;
            });

            return ExpansionTile(
              title: Text(
                ability.name,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              leading: Icon(Icons.offline_bolt,
                  color: widget.typeColors.defaultColor),
              iconColor: widget.typeColors.defaultColor,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  title: currentAbility != null
                      ? Text(
                          currentAbility.effects
                              .firstWhere((effect) => effect.language == 'en')
                              .effect,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(
                          color: widget.typeColors.defaultColor,
                        )),
                ),
              ],
              onExpansionChanged: (bool expanded) async {
                if (expanded == true) {
                  PokemonAbilities pokemonAbilitiesData =
                      await pokemonAbilitiesRepository
                          .getAbilities(ability.url);

                  setState(() {
                    pokemonAbilities = [
                      ...pokemonAbilities,
                      pokemonAbilitiesData
                    ];
                  });
                } else {
                  List<PokemonAbilities> pokemonAbilitiesCopy = [
                    ...pokemonAbilities
                  ];

                  if (pokemonAbilitiesCopy.length != 0) {
                    if (pokemonAbilitiesCopy.contains(currentAbility))
                      pokemonAbilitiesCopy.removeWhere(
                          (currentAbility) => currentAbility.id == abilityId);

                    setState(() {
                      pokemonAbilities = pokemonAbilitiesCopy;
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
