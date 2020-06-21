import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spacexopedia/bloc/dragon/index.dart';
import 'package:flutter_spacexopedia/ui/pages/common/error_page.dart';
import 'package:flutter_spacexopedia/ui/pages/common/no_connection.dart';
import 'package:flutter_spacexopedia/ui/pages/common/no_content.dart';
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
        } else if (currentState is ErrorDragonState) {
          return ErrorPage(
            dsiplayReloadButton: true,
            message: currentState.errorMessage,
            onReload: _load,
          );
        } else if (currentState is LoadedState) {
          if (currentState.list == null) return NoContent();
          return DragonScreen(dragonList: currentState.list);
        } else if (currentState is NoConnectionDragonState) {
          return NoInternetConnection(
            message: currentState.errorMessage,
            onReload: () {
              BlocProvider.of<DragonBloc>(context).add(LaunchInitial());
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
    _dragonBloc.add(LaunchInitial());
  }
}
