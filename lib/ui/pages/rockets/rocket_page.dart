import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/bloc/rocket/index.dart';
import 'package:flutter_spacexopedia/ui/pages/common/error_page.dart';
import 'package:flutter_spacexopedia/ui/pages/common/no_connection.dart';
import 'package:flutter_spacexopedia/ui/pages/common/no_content.dart';
import 'package:flutter_spacexopedia/ui/pages/rockets/rocket_screen.dart';

class RocketPage extends StatefulWidget {
  @override
  _RocketPageState createState() => _RocketPageState();
}

class _RocketPageState extends State<RocketPage> {
  final _rocketBloc = RocketBloc();

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RocketBloc, RocketState>(
      bloc: _rocketBloc,
      builder: (
        BuildContext context,
        RocketState currentState,
      ) {
        if (currentState is LoadingRockets) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (currentState is ErrorRocketState) {
          /// If any error occured during data fetching

          return ErrorPage(
            dsiplayReloadButton: true,
            message: currentState.errorMessage,
            onReload: _load,
          );
        } else if (currentState is LoadedRocketState) {
          /// If content is null

          if (currentState.list == null) return NoContent();

          /// If content is not null
          return RocketScreen(
            rockets: currentState.list,
          );
        } else if (currentState is NoConnectionDragonState) {
          /// If internet is not connected
          return NoInternetConnection(
            message: currentState.errorMessage,
            onReload: () {
              BlocProvider.of<RocketBloc>(context).add(LaunchInitial());
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void _load() {
    _rocketBloc.add(LaunchInitial());
  }
}
