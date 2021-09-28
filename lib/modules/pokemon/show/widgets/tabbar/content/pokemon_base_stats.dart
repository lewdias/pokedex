import 'package:flutter/material.dart';

class PokemonBaseStats extends StatelessWidget {
  const PokemonBaseStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 500,
        color: Colors.white,
        child: Center(
          child: Text(
            '<(v_ v<)',
          ),
        ),
      ),
    );
  }
}
