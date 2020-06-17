import 'package:flutter/foundation.dart';
import 'package:flutter_spacexopedia/bloc/dragon/dragon_model.dart';
import 'package:flutter_spacexopedia/resources/service/api_gatway.dart';

class DragonRepository {
  final ApiGateway apiGateway;

  DragonRepository({
    @required this.apiGateway
  }) : assert( apiGateway != null);

  Future<List<DragonModel>> fetchAllLaunch(){
      return apiGateway.fetchAllDragon();
  }
}