import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/bloc/roadster/index.dart';
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
    _roadsterBloc.add(LoadRoadsterEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RoadsterBloc, RoadsterState>(
        bloc: _roadsterBloc,
        builder: (
          BuildContext context,
          RoadsterState currentState,
        ) {
          if (currentState is ErrorRoadsterState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.error ?? 'Error'),
              ],
            ));
          }
          if (currentState is LoadedState) {
            return RoadsterScreen(
              model: currentState.model,
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
