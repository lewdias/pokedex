import 'package:flutter/material.dart';
import 'package:pokedex_4fun/modules/pokemon/list/repositories/pokemon_list_repository.dart';
import 'package:pokedex_4fun/pages/home.dart';
import 'package:pokedex_4fun/pages/pokemon/list.dart';
import 'package:provider/provider.dart';
import 'config/constants/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      initialRoute: PokemonListRoute,
      theme: new ThemeData(scaffoldBackgroundColor: Colors.grey.shade100),
      routes: {
        '/home': (context) => Home(title: "Pokédex"),
        PokemonListRoute: (context) => MultiProvider(
              providers: [
                Provider(create: (_) => PokemonListRepository()),
              ],
              child: PokemonListPage(),
            ),
      },
    );
  }
}
