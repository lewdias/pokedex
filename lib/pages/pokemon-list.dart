import 'package:flutter/material.dart';
import 'package:pokedex_4fun/config/constants/api_constants.dart'
    as apiConstants;
import 'package:pokedex_4fun/modules/pokemon/models/pokemon_info.dart';
import 'package:pokedex_4fun/modules/pokemon/list/repositories/pokemon_list_repository.dart';
import 'package:pokedex_4fun/modules/pokemon/list/widgets/pokemon_card.dart';
import 'package:pokedex_4fun/pages/widgets/custom-appbar.dart';
import 'package:provider/provider.dart';

class PokemonListPage extends StatefulWidget {
  PokemonListPage({Key? key}) : super(key: key);

  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  @override
  Widget build(BuildContext context) {
    final pokemonListRepository = Provider.of<PokemonListRepository>(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: 'First Generation',
        opacity: 0.8,
        backgroundColor: Colors.grey.shade100,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Center(
          child: FutureBuilder(
            future: pokemonListRepository.getPokemons(
                apiConstants.POKEAPI_FIRST_GENERATION, 0),
            builder: (BuildContext context,
                AsyncSnapshot<List<PokemonInfo>> snapshot) {
              if (snapshot.hasData) {
                return buildPokemonCard(context, snapshot.data);
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
