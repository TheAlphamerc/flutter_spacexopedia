import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'dart:developer' as developer;
import 'package:flutter_spacexopedia/bloc/launches/bloc.dart';
import 'package:flutter_spacexopedia/resources/repository/launch_repository.dart';

class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  final LaunchRepository repository;

  LaunchBloc(this.repository);
  LaunchState get initialState => Loading();

  @override
  Stream<LaunchState> mapEventToState(LaunchEvent event) async* {
    try {
      if (event is LaunchInitial) {
        yield Loading();
        final launchs = await repository.fetchAllLaunch();
        launchs.sort((x,y) => y.launchDateUtc.compareTo(x.launchDateUtc));
        if (launchs != null) {
          yield LoadedState(launchs);
        }
      } else {
        throw UnsupportedError('Unsupported event $event');
      }
    } on SocketException catch (_,stackTrace){
      developer.log('$_', name: 'LaunchBloc', error: _, stackTrace: stackTrace);
      yield NoConnectionDragonState(_.message);
    }
    catch (_, stackTrace) {
      developer.log('$_.', name: 'LaunchBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
