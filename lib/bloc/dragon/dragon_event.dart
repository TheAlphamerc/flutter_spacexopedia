import 'dart:async';
import 'dart:developer' as developer;

import 'package:equatable/equatable.dart';
import 'package:flutter_spacexopedia/bloc/dragon/index.dart';
import 'package:flutter_spacexopedia/resources/repository/dragon_repository.dart';
import 'package:flutter_spacexopedia/resources/service/api_gatway.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DragonEvent extends Equatable {
  @override
  List<Object> get props => [];

  Stream<DragonState> loadAsync({DragonState currentState, DragonBloc bloc});
  final DragonRepository _dragonRepository =
      DragonRepository(apiGateway: GetIt.instance<ApiGateway>());
}

class LoadDragonEvent extends DragonEvent {
  final bool isError;
  @override
  String toString() => 'LoadDragonEvent';

  LoadDragonEvent(this.isError);

  @override
  Stream<DragonState> loadAsync(
      {DragonState currentState, DragonBloc bloc}) async* {
    if (currentState is LoadedState) {
      return;
    }
    try {
      yield LoadingDragons();
      await Future.delayed(Duration(seconds: 1));
      final list = await _dragonRepository.fetchAllLaunch();
      yield LoadedState(list);
    } catch (_, stackTrace) {
      developer.log('$_',
          name: 'LoadDragonEvent', error: _, stackTrace: stackTrace);
      yield ErrorDragonState(0, _?.toString());
    }
  }
}
