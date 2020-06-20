import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/ui/theme/custom_theme.dart';

class ThemeProvider extends InheritedWidget {
  final CustomThemeState data;

  ThemeProvider({
    Widget child,
    Key key,
    this.data
  }) : assert(data != null), super(
          child: child,
          key: key,
           
        );

  static ThemeProvider of(BuildContext context) =>context.dependOnInheritedWidgetOfExactType<ThemeProvider>();

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
   return true;
  }
}
