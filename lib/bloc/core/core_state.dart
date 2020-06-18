import 'package:equatable/equatable.dart';
import 'package:flutter_spacexopedia/bloc/core/core_model.dart';

abstract class CoreState extends Equatable {
  
  @override
  List<Object> get props => ([]);
}
class LoadingCore extends CoreState {}

class LoadedState extends CoreState {
  final List<CoreModel> list;

  LoadedState(this.list);

  @override
  List<Object> get props => [];
}
class ErrorCoreState extends CoreState {
  final String errorMessage;

  ErrorCoreState(int version, this.errorMessage);
  
  @override
  String toString() => 'ErrorCoreState';

}
