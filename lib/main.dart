import 'package:flutter/material.dart';
import 'package:pokedex_4fun/pages/home.dart';
import 'package:pokedex_4fun/pages/pokemon-list.dart';
import 'package:provider/provider.dart';
import 'modules/pokemon/list/repositories/pokemon_list_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      initialRoute: '/pokemons',
      theme: new ThemeData(scaffoldBackgroundColor: Colors.grey.shade100),
      routes: {
        '/home': (context) => Home(title: "Pokédex"),
        '/pokemons': (context) => MultiProvider(
              providers: [
                Provider(create: (_) => PokemonListRepository()),
              ],
              child: PokemonListPage(),
            ),
      },
    );
  }
}
