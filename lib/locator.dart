import 'package:dio/dio.dart';
import 'package:findjobs/helper/config.dart';
import 'package:findjobs/resources/dio_client.dart';
import 'package:findjobs/resources/gatway/api_gateway.dart';
import 'package:findjobs/resources/gatway/api_gateway_impl.dart';
import 'package:get_it/get_it.dart';

void setUpDependency() {
  final serviceLocator = GetIt.instance;

  serviceLocator.registerLazySingleton<ApiGateway>(
    () => ApiGatewayImpl(
      DioClient(Dio(), baseEndpoint: Config.apiBaseUrl, logging: true),
    ),
  );
}
