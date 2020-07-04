import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/app.dart';
import 'package:flutter_spacexopedia/app_delegate.dart';
import 'package:flutter_spacexopedia/locator.dart';
import 'package:flutter_spacexopedia/ui/pages/home_page.dart';
import 'package:flutter_spacexopedia/ui/theme/custom_theme.dart';
import 'package:flutter_spacexopedia/ui/theme/theme.dart';

void main() {
  BlocSupervisor.delegate = AppBlocDelegate();
  setUpDependency();
  final app = SpaceApp(home: HomePage());
  runApp(
    CustomTheme(
      initialThemeKey: ThemeType.DARK,
      child: app,
    ),
  );
}
