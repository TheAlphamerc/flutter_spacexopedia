import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/bloc/core/index.dart';
import 'package:flutter_spacexopedia/ui/pages/core/core_screen.dart';

class CorePage extends StatefulWidget {
  static const String routeName = '/core';

  @override
  _CorePageState createState() => _CorePageState();
}

class _CorePageState extends State<CorePage> {
  final _coreBloc = CoreBloc();


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
    return BlocBuilder<CoreBloc, CoreState>(
        bloc: _coreBloc,
        builder: (
          BuildContext context,
          CoreState currentState,
        ) {
          if (currentState is LoadingCore) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (currentState is ErrorCoreState) {
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
            return CoreScreen(list:currentState.list);
          }
          return Center(
              child: CircularProgressIndicator(),
          );
          
        });
  }

  void _load([bool isError = false]) {
    _coreBloc.add(LoadCoreEvent(isError));
  }

}
