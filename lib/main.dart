import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/app_delegate.dart';
import 'package:flutter_spacexopedia/bloc/launches/bloc.dart';
import 'package:flutter_spacexopedia/bloc/launches/launch_bloc.dart';
import 'package:flutter_spacexopedia/dependencies.dart';
import 'package:flutter_spacexopedia/service/api_gatway.dart';
import 'package:flutter_spacexopedia/service/launch_repository.dart';
import 'package:flutter_spacexopedia/ui/pages.dart/home_page.dart';
import 'package:get_it/get_it.dart';

import 'bloc/navigation/navigation_bloc.dart';

void main() {
  BlocSupervisor.delegate = AppBlocDelegate();
  setUpDependency();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),

        // home:
        home: MultiBlocProvider(
          providers: [
            BlocProvider<NavigationBloc>(
              create: (BuildContext context) => NavigationBloc(),
            ),
            BlocProvider<LaunchBloc>(
              create: (BuildContext context) => LaunchBloc(GetIt.instance<LaunchRepository>())..add(LaunchInitial()),
            ),
          ],
          child:  HomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}
