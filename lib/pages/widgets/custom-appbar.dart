import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? height;
  final double? opacity;
  final Color? backgroundColor;

  Size get preferredSize {
    return new Size.fromHeight(height ?? 50.0);
  }

  const CustomAppBar({
    Key? key,
    required this.title,
    this.height,
    this.opacity,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title.toUpperCase(),
        style: GoogleFonts.pressStart2p(
          color: Colors.black,
          fontSize: 10,
          fontWeight: FontWeight.w800,
          letterSpacing: 1,
        ),
      ),
      elevation: 0,
      backgroundColor: backgroundColor?.withOpacity(opacity ?? 0.0) ?? null,
      leading: Icon(
        Icons.arrow_back_rounded,
        color: Colors.black,
        size: 24.0,
        semanticLabel: 'Go back to previous page.',
      ),
      actions: <Widget>[],
    );
  }
}
