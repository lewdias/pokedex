import 'package:pokedex_4fun/utils/capitalize.dart';

String humanize(String string) {
  String stringWithoutSpecialChars =
      string.replaceAll(RegExp('[^A-Za-z0-9]'), ' ');

  return capitalize(stringWithoutSpecialChars);
}
