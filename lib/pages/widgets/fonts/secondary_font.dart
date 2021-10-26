import 'package:flutter/material.dart';

class SecondaryFont extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;

  const SecondaryFont({
    required this.text,
    this.size,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SecondaryFont(
      text: this.text,
      color: color ?? Colors.black,
      size: size ?? 14,
      fontWeight: fontWeight ?? FontWeight.w400,
    );
  }
}
