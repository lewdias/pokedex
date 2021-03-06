import 'package:flutter/material.dart';
import 'package:pokedex_4fun/pages/widgets/fonts/primary_font.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double? height;
  final double? opacity;
  final Color? backgroundColor;
  final Color? iconColor;
  final bool? isHomePage;

  Size get preferredSize {
    return new Size.fromHeight(height ?? 50.0);
  }

  const CustomAppBar({
    Key? key,
    this.title,
    this.height,
    this.opacity,
    this.backgroundColor,
    this.iconColor,
    this.isHomePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: PrimaryFont(
        text: title?.toUpperCase() ?? '',
        color: Colors.black,
        size: 18,
        fontWeight: FontWeight.w800,
      ),
      elevation: 0,
      backgroundColor: backgroundColor?.withOpacity(opacity ?? 0.8) ??
          Colors.grey.shade100.withOpacity(opacity ?? 0.8),
      leading: isHomePage == null
          ? IconButton(
              onPressed: () {
                Navigator.of(context).maybePop();
              },
              icon: const Icon(Icons.arrow_back),
              color: iconColor ?? Colors.black,
              iconSize: 24.0,
              highlightColor: Colors.white.withOpacity(0.2),
              tooltip: 'Go back to previous page.',
            )
          : null,
      actions: <Widget>[],
    );
  }
}
