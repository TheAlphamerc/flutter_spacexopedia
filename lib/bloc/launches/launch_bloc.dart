import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_spacexopedia/bloc/launches/bloc.dart';
import 'package:flutter_spacexopedia/service/launch_repository.dart';

class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  final LaunchRepository repository;

  LaunchBloc(this.repository);
  LaunchState get initialState => Loading();

  @override
  Stream<LaunchState> mapEventToState(LaunchEvent event) async* {
    if (event is LaunchInitial) {
      yield Loading();
      final launchs = await repository.fetchAllLaunch();
      if(launchs != null){
        yield LoadedState(launchs);
      }
    } else {
      throw UnsupportedError('Unsupported event $event');
    }
  }
}
