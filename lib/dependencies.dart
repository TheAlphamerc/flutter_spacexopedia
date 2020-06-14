import 'package:dio/dio.dart';
import 'package:flutter_spacexopedia/helper/config.dart';
import 'package:flutter_spacexopedia/service/api_gatway.dart';
import 'package:flutter_spacexopedia/service/api_gatway_impl.dart';
import 'package:flutter_spacexopedia/service/dio_client.dart';
import 'package:flutter_spacexopedia/service/launch_repository.dart';
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
