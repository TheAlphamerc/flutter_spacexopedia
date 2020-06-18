import 'package:flutter/foundation.dart';
import 'package:flutter_spacexopedia/bloc/core/core_model.dart';
import 'package:flutter_spacexopedia/resources/service/api_gatway.dart';

class CoreRepository {
  final ApiGateway apiGateway;

  CoreRepository({
    @required this.apiGateway
  }) : assert( apiGateway != null);

  Future<List<CoreModel>> fetchAllCores(){
      return apiGateway.fetchAllCores();
  }
}