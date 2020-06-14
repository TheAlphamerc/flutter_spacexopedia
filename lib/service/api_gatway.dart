import 'package:flutter_spacexopedia/bloc/launches/launch_model.dart';

abstract class ApiGateway {
  Future<List<Launch>> fetchAllLaunch(); 
}