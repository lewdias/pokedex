import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_4fun/modules/pokemon/details/models/pokemon_abilities.dart';
import 'package:pokedex_4fun/modules/pokemon/details/widgets/tabbar/content/content_height.dart';
import 'package:pokedex_4fun/modules/pokemon/details/repositories/pokemon_ability_repository.dart';
import 'package:pokedex_4fun/modules/pokemon/details/models/pokemon_load_data.dart';
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_type.dart';
import 'package:pokedex_4fun/pages/widgets/fonts/primary_font.dart';
import 'package:pokedex_4fun/pages/widgets/fonts/secondary_font.dart';
import 'package:provider/provider.dart';

class PokemonAbilitiesTab extends StatefulWidget {
  final List<PokemonLoadData> abilities;
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
          children:
              widget.abilities.mapIndexed((int index, PokemonLoadData ability) {
            int abilityId = int.parse(ability.url.split('/')[6]);

            PokemonAbilities? currentAbility =
                pokemonAbilities.firstWhereOrNull((ab) {
              return ab.id == abilityId;
            });

            return ExpansionTile(
              title: PrimaryFont(text: ability.name),
              leading: Icon(Icons.offline_bolt,
                  color: widget.typeColors.defaultColor),
              iconColor: widget.typeColors.defaultColor,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  title: currentAbility != null
                      ? SecondaryFont(
                          text: currentAbility.effects
                              .firstWhere((effect) => effect.language == 'en')
                              .effect)
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
