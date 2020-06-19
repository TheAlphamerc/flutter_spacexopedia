import 'package:dio/dio.dart';
import 'package:flutter_spacexopedia/helper/config.dart';
import 'package:flutter_spacexopedia/resources/dio_client.dart';
import 'package:flutter_spacexopedia/resources/repository/launch_repository.dart';
import 'package:flutter_spacexopedia/resources/service/api_gatway.dart';
import 'package:flutter_spacexopedia/resources/service/api_gatway_impl.dart';
import 'package:get_it/get_it.dart';

void setUpDependency() {
  final serviceLocator = GetIt.instance;


  serviceLocator.registerLazySingleton<ApiGateway>(
    () => ApiGatewayImpl(
      DioClient(
        Dio(),
        baseEndpoint: Config.apiBaseUrl,
        logging: true
      ),
    ),
  );
   
  GetIt.instance.registerSingleton<LaunchRepository>(LaunchRepository(
    apiGateway: GetIt.instance<ApiGateway>()
  ));
  
}
