import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/bloc/roadster/roadster_model.dart';
import 'package:flutter_spacexopedia/resources/service/api_gatway.dart';

class RoadsterRepository{
   final ApiGateway apiGateway;

  RoadsterRepository({
    @required this.apiGateway
  }) : assert( apiGateway != null);

  Future<RoadsterModel> fetchAllLaunch(){
      return apiGateway.fetchRoadster();
  } 
}