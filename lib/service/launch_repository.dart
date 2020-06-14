import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/bloc/launches/launch_model.dart';
import 'package:flutter_spacexopedia/service/api_gatway.dart';

class LaunchRepository {
  static const baseUrl = 'https://www.metaweather.com';
  final ApiGateway apiGateway;

  LaunchRepository({
    @required this.apiGateway
  }) : assert( apiGateway != null);

  Future<List<Launch>> fetchAllLaunch(){
      return apiGateway.fetchAllLaunch();
  } 
}
