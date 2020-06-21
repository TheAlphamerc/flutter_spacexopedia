import 'dart:async';
import 'dart:developer' as developer;

import 'package:equatable/equatable.dart';
import 'package:flutter_spacexopedia/bloc/core/index.dart';
import 'package:flutter_spacexopedia/resources/repository/core_repository.dart';
import 'package:flutter_spacexopedia/resources/service/api_gatway.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

@immutable
abstract class CoreEvent extends Equatable {
  @override
  List<Object> get props => [];
  Stream<CoreState> loadAsync(
      {CoreState currentState, CoreBloc bloc});
  final CoreRepository _coreRepository = CoreRepository(apiGateway: GetIt.instance<ApiGateway>());
}



class LaunchInitial extends CoreEvent {
   
  @override
  String toString() => 'LoadCoreEvent';

  LaunchInitial();

  @override
  Stream<CoreState> loadAsync(
      {CoreState currentState, CoreBloc bloc}) async* {
    try {
      if(currentState is LoadedState){
        return;
      }
      yield LoadingCore();
      await Future.delayed(Duration(seconds: 1));
      final list = await _coreRepository.fetchAllCores();
      yield LoadedState(list);
    } catch (_, stackTrace) {
      developer.log('$_', name: 'LoadCoreEvent', error: _, stackTrace: stackTrace);
      yield ErrorCoreState(0, _?.toString());
    }
  }
}
