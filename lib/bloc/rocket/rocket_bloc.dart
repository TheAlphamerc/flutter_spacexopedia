import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:flutter_spacexopedia/bloc/rocket/index.dart';

class RocketBloc extends Bloc<RocketEvent, RocketState> {

  static final RocketBloc _roadsterBlocSingleton = RocketBloc._internal();
  factory RocketBloc() {
    return _roadsterBlocSingleton;
  }
  RocketBloc._internal();
  
  @override
  Future<void> close() async{
    // dispose objects
    await super.close();
  }

  @override
  RocketState get initialState => LoadingRockets();

  @override
  Stream<RocketState> mapEventToState(
    RocketEvent event,
  ) async* {
    try {
      yield* event.loadAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'RocketBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
