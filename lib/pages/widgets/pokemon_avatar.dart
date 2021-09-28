import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonAvatar extends StatelessWidget {
  final String? sprite;
  const PokemonAvatar({Key? key, required this.sprite}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 160,
      child: IgnorePointer(
        ignoring: true,
        child: Container(
          child: SizedBox(
            height: 200,
            width: 200,
            child: CircleAvatar(
              child: CachedNetworkImage(
                imageUrl: sprite ?? '',
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
