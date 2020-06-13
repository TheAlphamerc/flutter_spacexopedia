import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/app_delegate.dart';
import 'package:flutter_spacexopedia/ui/pages.dart/home_page.dart';

import 'bloc/navigation/navigation_bloc.dart';

void main() {
  BlocSupervisor.delegate = AppBlocDelegate();
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
          ],
          child:  HomePage(title: 'Flutter Demo Home Page'),
        ));
  }
}
