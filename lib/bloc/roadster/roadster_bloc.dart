import 'dart:async';
import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:flutter_spacexopedia/bloc/roadster/index.dart';

class RoadsterBloc extends Bloc<RoadsterEvent, RoadsterState> {
  // todo: check singleton for logic in project
  static final RoadsterBloc _roadsterBlocSingleton = RoadsterBloc._internal();
  factory RoadsterBloc() {
    return _roadsterBlocSingleton;
  }
  RoadsterBloc._internal();
  
  @override
  Future<void> close() async{
    // dispose objects
    await super.close();
  }

  @override
  RoadsterState get initialState => LoadingRoadster();

  @override
  Stream<RoadsterState> mapEventToState(
    RoadsterEvent event,
  ) async* {
    try {
      yield* event.loadAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'RoadsterBloc', error: _, stackTrace: stackTrace);
      yield state;
    }
  }
}
