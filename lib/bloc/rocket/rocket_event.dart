import 'dart:async';
import 'dart:developer' as developer;

import 'package:equatable/equatable.dart';
import 'package:flutter_spacexopedia/bloc/rocket/index.dart';
import 'package:flutter_spacexopedia/resources/repository/rocket_repository.dart';
import 'package:flutter_spacexopedia/resources/service/api_gatway.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RocketEvent extends Equatable {
  @override
  List<Object> get props => [];
  Stream<RocketState> loadAsync({RocketState currentState, RocketBloc bloc});
  final RocketRepository _roadsterRepository =
      RocketRepository(apiGateway: GetIt.instance<ApiGateway>());
}

class LaunchInitial extends RocketEvent {
  @override
  Stream<RocketState> loadAsync(
      {RocketState currentState, RocketBloc bloc}) async* {
    try {
      if (currentState is LoadedRocketState) {
        return;
      }
      yield LoadingRockets();
      final rockets = await _roadsterRepository.fetchAllRocket();
      yield LoadedRocketState(rockets);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadRocketEvent', error: _, stackTrace: stackTrace);
      yield ErrorRocketState(_?.toString());
    }
  }
}
