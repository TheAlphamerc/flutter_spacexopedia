import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/bloc/rocket/index.dart';
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
          }
          if (currentState is ErrorRocketState) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(currentState.errorMessage ?? 'Error'),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: RaisedButton(
                    color: Colors.blue,
                    child: Text('reload'),
                    onPressed: _load,
                  ),
                ),
              ],
            ));
          }
           if (currentState is LoadedRocketState) {
            return RocketScreen(rockets: currentState.list,);
          }
          return Center(
              child: CircularProgressIndicator(),
          );
          
        });
  }

  void _load() {
    _rocketBloc.add(LoadRocketEvent());
  }
}
