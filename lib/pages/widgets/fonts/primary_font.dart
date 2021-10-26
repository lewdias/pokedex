import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryFont extends StatelessWidget {
  final String text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;

  const PrimaryFont({
    required this.text,
    this.size,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: GoogleFonts.montserrat(
        color: color ?? Colors.black,
        fontSize: size ?? 16,
        fontWeight: fontWeight ?? FontWeight.w800,
      ),
    );
  }
}
