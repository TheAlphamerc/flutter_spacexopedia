import 'package:dio/dio.dart';
import 'package:flutter_spacexopedia/bloc/core/core_model.dart';
import 'package:flutter_spacexopedia/bloc/dragon/dragon_model.dart';
import 'package:flutter_spacexopedia/bloc/launches/launch_model.dart';
import 'package:flutter_spacexopedia/bloc/roadster/roadster_model.dart';
import 'package:flutter_spacexopedia/bloc/rocket/rocket_model.dart';
import 'package:flutter_spacexopedia/exceptions/exceptions.dart';
import 'package:flutter_spacexopedia/helper/config.dart';
import 'package:flutter_spacexopedia/resources/dio_client.dart';
import 'package:flutter_spacexopedia/resources/service/api_gatway.dart';

class ApiGatewayImpl implements ApiGateway {
  final DioClient _dioClient;

  ApiGatewayImpl(this._dioClient);
  @override
  Future<List<Launch>> fetchAllLaunch() async {
    try {
      var response = await _dioClient.get(Config.launchAll);
      List<Launch> launch = List<Launch>();
      bool isSuccess = _isSuccessOrThrow(response);
      if (isSuccess) {
        print("Api get data sucess");
        launch = _dioClient.getJsonBodyList(response).map((value) {
          return Launch.fromJson(value);
        }).toList();
      } else {
        print("Error");
      }
      return launch;
    } catch (error) {
      throw error;
    }
  }

  @override
  Future<RoadsterModel> fetchRoadster() async {
    try {
      var response = await _dioClient.get(Config.roadster);
      bool isSuccess = _isSuccessOrThrow(response);
      if (isSuccess) {
        return RoadsterModel.fromJson(_dioClient.getJsonBody(response));
      } else {
        return null;
      }
    } catch (error) {
      throw error;
    }
  }

  @override
  Future<List<RocketModel>> fetchAllRocket() async {
    try {
      var response = await _dioClient.get(Config.allRockets);
      List<RocketModel> rockets = List<RocketModel>();
      bool isSuccess = _isSuccessOrThrow(response);
      if (isSuccess) {
        print("Api get data sucess");
        rockets = _dioClient.getJsonBodyList(response).map((value) {
          return RocketModel.fromJson(value);
        }).toList();
      } else {
        print("Error");
      }
      return rockets;
    } catch (error) {
      throw error;
    }
  }

  @override
  Future<List<DragonModel>> fetchAllDragon() async {
    try {
      var response = await _dioClient.get(Config.allDragons);
      List<DragonModel> rockets = List<DragonModel>();
      bool isSuccess = _isSuccessOrThrow(response);
      if (isSuccess) {
        print("Api get data sucess");
        rockets = _dioClient.getJsonBodyList(response).map((value) {
          return DragonModel.fromJson(value);
        }).toList();
      } else {
        print("Error");
      }
      return rockets;
    } catch (error) {
      throw error;
    }
  }

  @override
  Future<List<CoreModel>> fetchAllCores() async {
    try {
      var response = await _dioClient.get(Config.allCores);
      List<CoreModel> cores = List<CoreModel>();
      bool isSuccess = _isSuccessOrThrow(response);
      if (isSuccess) {
        print("Api get data sucess");
        cores = _dioClient.getJsonBodyList(response).map((value) {
          return CoreModel.fromJson(value);
        }).toList();
      } else {
        print("Error");
      }
      return cores;
    } catch (error) {
      throw error;
    }
  }

  bool _isSuccessOrThrow(Response response) {
    print("ApiGateway isSuccess");
    switch (response.statusCode) {
      case 200:
        return true;
      case 201:
        return true;
      case 400:
        throw BadRequestException("Bad request");
      case 401:
      case 403:
        throw UnauthorisedException("Session expired");
      case 404:
        throw ResourceNotFoundException(response.statusMessage.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communicating with server : ${response.statusCode}');
    }
  }
}
