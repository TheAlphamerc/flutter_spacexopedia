import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/app_delegate.dart';
import 'package:flutter_spacexopedia/bloc/launches/bloc.dart';
import 'package:flutter_spacexopedia/bloc/launches/launch_bloc.dart';
import 'package:flutter_spacexopedia/locator.dart';
import 'package:flutter_spacexopedia/resources/repository/launch_repository.dart';
import 'package:flutter_spacexopedia/ui/pages/home_page.dart';
import 'package:flutter_spacexopedia/ui/theme/custom_theme.dart';
import 'package:flutter_spacexopedia/ui/theme/theme.dart';
import 'package:get_it/get_it.dart';
import 'bloc/navigation/navigation_bloc.dart';

void main() {
  BlocSupervisor.delegate = AppBlocDelegate();
  setUpDependency();
  runApp(
    CustomTheme(
      initialThemeKey: ThemeType.DARK,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.of(context),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<NavigationBloc>(
            create: (BuildContext context) => NavigationBloc(),
          ),
          BlocProvider<LaunchBloc>(
            create: (BuildContext context) =>
                LaunchBloc(GetIt.instance<LaunchRepository>())
                  ..add(LaunchInitial()),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
