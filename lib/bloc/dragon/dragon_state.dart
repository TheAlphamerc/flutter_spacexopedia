import 'package:equatable/equatable.dart';
import 'package:flutter_spacexopedia/bloc/dragon/dragon_model.dart';

abstract class DragonState extends Equatable {
  @override
  List<Object> get props => ([]);
}

class LoadingDragons extends DragonState {}

class LoadedState extends DragonState {
  final List<DragonModel> list;

  LoadedState(this.list);

  @override
  List<Object> get props => [];
}

class ErrorDragonState extends DragonState {
  final String errorMessage;

  ErrorDragonState(int version, this.errorMessage);

  @override
  String toString() => 'ErrorDragonState';
}

class NoConnectionDragonState extends DragonState {
  final String errorMessage;

  NoConnectionDragonState(this.errorMessage);

  @override
  String toString() => 'ErrorLaunchState';
}
