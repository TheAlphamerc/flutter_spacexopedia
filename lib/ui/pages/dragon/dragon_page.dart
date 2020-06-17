import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/bloc/dragon/index.dart';
import 'package:flutter_spacexopedia/ui/pages/dragon/dragon_screen.dart';

class DragonPage extends StatefulWidget {
  @override
  _DragonPageState createState() => _DragonPageState();
}

class _DragonPageState extends State<DragonPage> {
  final _dragonBloc = DragonBloc();
  
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
    return BlocBuilder<DragonBloc, DragonState>(
        bloc: _dragonBloc,
        builder: (
          BuildContext context,
          DragonState currentState,
        ) {
          if (currentState is LoadingDragons) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorDragonState) {
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
           if (currentState is LoadedState) {
            return DragonScreen(dragonList:currentState.list);
          }
          return Center(
              child: CircularProgressIndicator(),
          );
          
        });
  }

  void _load([bool isError = false]) {
    _dragonBloc.add(LoadDragonEvent(isError));
  }
}
