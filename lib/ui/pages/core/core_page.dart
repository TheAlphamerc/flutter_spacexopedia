import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/bloc/core/index.dart';
import 'package:flutter_spacexopedia/ui/pages/common/error_page.dart';
import 'package:flutter_spacexopedia/ui/pages/common/no_connection.dart';
import 'package:flutter_spacexopedia/ui/pages/common/no_content.dart';
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
        } else if (currentState is ErrorCoreState) {
          return ErrorPage(
            dsiplayReloadButton: true,
            message: currentState.errorMessage,
            onReload: _load,
          );
        } else if (currentState is LoadedState) {
          if (currentState.list == null) return NoContent();
          return CoreScreen(list: currentState.list);
        } else if (currentState is NoConnectionDragonState) {
          return NoInternetConnection(
            message: currentState.errorMessage,
            onReload: () {
              BlocProvider.of<CoreBloc>(context).add(LaunchInitial());
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
    _coreBloc.add(LaunchInitial());
  }
}
