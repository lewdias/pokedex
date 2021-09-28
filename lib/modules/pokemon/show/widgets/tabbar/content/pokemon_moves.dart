import 'package:flutter/material.dart';

class PokemonMoves extends StatelessWidget {
  const PokemonMoves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 500,
        color: Colors.white,
        child: Center(
          child: Text(
            'i_i',
          ),
        ),
      ),
    );
  }
}
