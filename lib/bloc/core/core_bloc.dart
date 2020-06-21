import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_spacexopedia/bloc/core/index.dart';

class CoreBloc extends Bloc<CoreEvent, CoreState> {
  // todo: check singleton for logic in project
  static final CoreBloc _coreBlocSingleton = CoreBloc._internal();
  factory CoreBloc() {
    return _coreBlocSingleton;
  }
  CoreBloc._internal();

  @override
  Future<void> close() async {
    // dispose objects
    await super.close();
  }

  @override
  CoreState get initialState => LoadingCore();

  @override
  Stream<CoreState> mapEventToState(
    CoreEvent event,
  ) async* {
    try {
      if (event is LaunchInitial) {
        yield* event.loadAsync(currentState: state, bloc: this);
      }
    } on SocketException catch (_, stackTrace) {
      developer.log('$_', name: 'CorehBloc', error: _, stackTrace: stackTrace);
      yield NoConnectionDragonState(_.message);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'CoreBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
