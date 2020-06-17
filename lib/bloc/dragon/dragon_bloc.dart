import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:flutter_spacexopedia/bloc/dragon/index.dart';

class DragonBloc extends Bloc<DragonEvent, DragonState> {
  // todo: check singleton for logic in project
  static final DragonBloc _dragonBlocSingleton = DragonBloc._internal();
  factory DragonBloc() {
    return _dragonBlocSingleton;
  }
  DragonBloc._internal();
  
  @override
  Future<void> close() async{
    // dispose objects
    await super.close();
  }

  @override
  DragonState get initialState => LoadingDragons();

  @override
  Stream<DragonState> mapEventToState(
    DragonEvent event,
  ) async* {
    try {
      yield* event.loadAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'DragonBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
