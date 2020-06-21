import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/bloc/roadster/index.dart';
import 'package:flutter_spacexopedia/ui/pages/common/error_page.dart';
import 'package:flutter_spacexopedia/ui/pages/common/no_connection.dart';
import 'package:flutter_spacexopedia/ui/pages/common/no_content.dart';
import 'package:flutter_spacexopedia/ui/pages/roadster/roadster_screen.dart';

class RoadsterPage extends StatefulWidget {
  @override
  _RoadsterPageState createState() => _RoadsterPageState();
}

class _RoadsterPageState extends State<RoadsterPage> {
  final _roadsterBloc = RoadsterBloc();
  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _load() {
    _roadsterBloc.add(LaunchInitial());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: BlocBuilder<RoadsterBloc, RoadsterState>(
        bloc: _roadsterBloc,
        builder: (
          BuildContext context,
          RoadsterState currentState,
        ) {
          if (currentState is ErrorRoadsterState) {
            return ErrorPage(
              dsiplayReloadButton: true,
              message: currentState.error,
              onReload: _load,
            );
          } else if (currentState is LoadedState) {
            if (currentState.model == null) return NoContent();
            return RoadsterScreen(
              model: currentState.model,
            );
          } else if (currentState is NoConnectionDragonState) {
            return NoInternetConnection(
              message: currentState.errorMessage,
              onReload: () {
                BlocProvider.of<RoadsterBloc>(context).add(LaunchInitial());
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
