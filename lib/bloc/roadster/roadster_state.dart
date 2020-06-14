import 'package:equatable/equatable.dart';
import 'package:flutter_spacexopedia/bloc/roadster/roadster_model.dart';

abstract class RoadsterState extends Equatable {
  @override
  List<Object> get props => ([]);
}

class LoadingRoadster extends RoadsterState {}

class LoadedState extends RoadsterState {
  final RoadsterModel model;

  LoadedState(this.model);
  @override
  List<Object> get props => [];
}

class ErrorRoadsterState extends RoadsterState {
  final String error;

  ErrorRoadsterState(this.error);
}