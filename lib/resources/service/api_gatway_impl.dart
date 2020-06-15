import 'package:flutter_spacexopedia/bloc/launches/launch_model.dart';
import 'package:flutter_spacexopedia/bloc/roadster/roadster_model.dart';
import 'package:flutter_spacexopedia/bloc/rocket/rocket_model.dart';
import 'package:flutter_spacexopedia/helper/config.dart';
import 'package:flutter_spacexopedia/resources/dio_client.dart';
import 'package:flutter_spacexopedia/resources/service/api_gatway.dart';

class ApiGatewayImpl implements ApiGateway {
  final DioClient _dioClient;

  ApiGatewayImpl(this._dioClient);
  @override
  Future<List<Launch>> fetchAllLaunch()async{
    var response = await _dioClient.get(Config.launchAll);
     List<Launch> launch = List<Launch>();
    if(response.statusCode == 200){
      print("Api get data sucess");
      launch =  _dioClient.getJsonBodyList(response).map((value){
            return Launch.fromJson(value);
        }).toList();
    }
    else{
      print("Error");
    }
    return launch;
  }

  @override
  Future<RoadsterModel> fetchRoadster() async{
   var response = await _dioClient.get(Config.roadster);
   if(response.statusCode == 200){
     return RoadsterModel.fromJson(_dioClient.getJsonBody(response));
   }
   else{
     return null;
   }
  }

  @override
  Future<List<RocketModel>> fetchAllRocket() async{
    var response = await _dioClient.get(Config.allRockets);
     List<RocketModel> rockets = List<RocketModel>();
    if(response.statusCode == 200){
      print("Api get data sucess");
      rockets =  _dioClient.getJsonBodyList(response).map((value){
            return RocketModel.fromJson(value);
        }).toList();
    }
    else{
      print("Error");
    }
    return rockets;
  }
}
