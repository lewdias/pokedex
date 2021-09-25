import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex_4fun/utils/hexcolor.dart';

class PokemonCardType extends StatelessWidget {
  final Map<String, String?>? type;
  final int index;

  const PokemonCardType({Key? key, required this.type, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(index > 0 ? 5 : 0, 10, 0, 0),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: getColorFromHex('${type?['color']}'),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
      ),
      child: Text(
        '${type?['name']}',
        style: GoogleFonts.pressStart2p(
          fontSize: 8,
          color: Colors.white,
        ),
      ),
    );
  }
}
