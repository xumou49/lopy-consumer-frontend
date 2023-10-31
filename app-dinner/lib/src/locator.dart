import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:Lopy/src/config/routers/app_router.dart';
import 'data/data_sources/remote/restaurants_api.dart';
import 'data/repositories/api_repository_impl.dart';
import 'domain/repositories/api_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());
  
  locator.registerSingleton(AppRouter());
  locator.registerSingleton<Dio>(dio);
  
  locator.registerSingleton<RestaurantsApi>(
    RestaurantsApi(locator<Dio>()),
  );

  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(locator<RestaurantsApi>()),
  );
}
