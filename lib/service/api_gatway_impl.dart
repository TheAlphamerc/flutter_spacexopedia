import 'package:flutter_spacexopedia/bloc/launches/launch_model.dart';
import 'package:flutter_spacexopedia/helper/config.dart';
import 'package:flutter_spacexopedia/service/api_gatway.dart';
import 'package:flutter_spacexopedia/service/dio_client.dart';

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
}
