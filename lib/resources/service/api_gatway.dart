import 'package:flutter_spacexopedia/bloc/launches/launch_model.dart';
import 'package:flutter_spacexopedia/bloc/roadster/roadster_model.dart';

abstract class ApiGateway {
  Future<List<Launch>> fetchAllLaunch(); 
  Future<RoadsterModel> fetchRoadster();
}