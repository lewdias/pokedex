import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonCardAvatar extends StatelessWidget {
  final String? officialArtwork;

  const PokemonCardAvatar({Key? key, required this.officialArtwork})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: CircleAvatar(
        child: CachedNetworkImage(
          imageUrl: officialArtwork ?? '',
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
