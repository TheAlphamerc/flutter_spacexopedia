import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LaunchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LaunchInitial extends LaunchEvent {}

class SelectedLaunch extends LaunchEvent{
  final int flightNumber;
  SelectedLaunch(this.flightNumber);

 @override
  List<Object> get props => ["Select flight: $flightNumber"];
}
