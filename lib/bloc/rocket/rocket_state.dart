import 'package:equatable/equatable.dart';
import 'package:flutter_spacexopedia/bloc/rocket/rocket_model.dart';

abstract class RocketState extends Equatable {
  final List propss;
  RocketState([this.propss]);

  @override
  List<Object> get props => (propss ?? []);
}

class LoadingRockets extends RocketState {}

/// Initialized
class LoadedRocketState extends RocketState {
  final List<RocketModel> list;

  LoadedRocketState(this.list) : super([list]);

  @override
  List<Object> get props => [];
}

class ErrorRocketState extends RocketState {
  final String errorMessage;

  ErrorRocketState(this.errorMessage) : super([errorMessage]);

  @override
  String toString() => 'ErrorRocketState';
}

class NoConnectionDragonState extends RocketState {
  final String errorMessage;

  NoConnectionDragonState(this.errorMessage);

  @override
  String toString() => 'ErrorLaunchState';
}
