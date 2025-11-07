import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppStatusBar extends StatelessWidget {
  final Color color;
  final bool darkIcons;
  final Widget child;

  const AppStatusBar({
    super.key,
    required this.color,
    required this.darkIcons,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final SystemUiOverlayStyle style = SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: darkIcons ? Brightness.dark : Brightness.light,
      // On iOS, this controls the status bar icon/text color (inverted semantics)
      statusBarBrightness: darkIcons ? Brightness.light : Brightness.dark,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: style,
      child: child,
    );
  }
}
