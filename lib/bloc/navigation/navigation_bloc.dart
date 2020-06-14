import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_spacexopedia/bloc/navigation/navigationEvent.dart';
import 'package:flutter_spacexopedia/bloc/navigation/navigationState.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  @override
  NavigationState get initialState => SelectPageIndex(0);

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is IndexSelected) {
      yield SelectPageIndex(event.index);
    } else {
      throw UnsupportedError('Unsupported event $event');
    }
  }
}