import 'package:flutter/material.dart';
import 'package:flutter_spacexopedia/bloc/rocket/rocket_model.dart';
import 'package:flutter_spacexopedia/resources/service/api_gatway.dart';

class RocketRepository{
   final ApiGateway apiGateway;

  RocketRepository({
    @required this.apiGateway
  }) : assert( apiGateway != null);

  Future<List<RocketModel>> fetchAllRocket(){
      return apiGateway.fetchAllRocket();
  } 
}