import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PokemonCardAvatar extends StatelessWidget {
  final String? sprite;

  const PokemonCardAvatar({Key? key, required this.sprite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: CircleAvatar(
        child: CachedNetworkImage(
          imageUrl: sprite ?? '',
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
