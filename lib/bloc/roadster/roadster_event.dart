import 'dart:async';
import 'dart:developer' as developer;

import 'package:equatable/equatable.dart';
import 'package:flutter_spacexopedia/bloc/roadster/index.dart';
import 'package:flutter_spacexopedia/resources/repository/roadster_repository.dart';
import 'package:flutter_spacexopedia/resources/service/api_gatway.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RoadsterEvent extends Equatable{
  @override
  List<Object> get props => [];

  Stream<RoadsterState> loadAsync(
      {RoadsterState currentState, RoadsterBloc bloc});
  final RoadsterRepository _roadsterRepository = RoadsterRepository(apiGateway: GetIt.instance<ApiGateway>());
}



class LaunchInitial extends RoadsterEvent {
   
  @override
  String toString() => 'LoadRoadsterEvent';

  LaunchInitial();

  @override
  Stream<RoadsterState> loadAsync(
      {RoadsterState currentState, RoadsterBloc bloc}) async* {
    try {
      if(currentState is LoadedState){
        return;
      }
      yield LoadingRoadster();
      await Future.delayed(Duration(seconds: 1));
      final model = await _roadsterRepository.fetchAllLaunch();
      yield LoadedState(model);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadRoadsterEvent', error: _, stackTrace: stackTrace);
      yield ErrorRoadsterState(_?.toString());
    }
  }
}
