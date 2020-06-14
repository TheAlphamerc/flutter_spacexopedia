import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'launch_model.dart';

@immutable
abstract class LaunchState extends Equatable {
   @override
  List<Object> get props => [];
}

class Loading extends LaunchState {}

class LoadedState extends LaunchState {
  final List<Launch> allLaunch;

  LoadedState(this.allLaunch);
  @override
  List<Object> get props => ["Total launch ${allLaunch.length}"];
}
