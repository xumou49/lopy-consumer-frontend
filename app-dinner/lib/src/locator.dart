import 'package:Lopy/src/data/data_sources/remote/login_api.dart';
import 'package:Lopy/src/data/data_sources/remote/restaurant_info_api.dart';
import 'package:Lopy/src/data/repositories/firebase_repository_impl.dart';
import 'package:Lopy/src/domain/repositories/firebase_repository.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:Lopy/src/config/routers/app_router.dart';
import '../firebase_options.dart';
import 'data/data_sources/remote/restaurants_api.dart';
import 'data/repositories/api_repository_impl.dart';
import 'domain/repositories/api_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  locator.registerSingleton(AppRouter());
  locator.registerSingleton<Dio>(dio);

  // register apis here
  locator.registerSingleton<RestaurantsApi>(
    RestaurantsApi(locator<Dio>()),
  );

  locator.registerSingleton<LoginApi>(
    LoginApi(locator<Dio>()),
  );

  locator.registerSingleton<RestaurantInfoApi>(
    RestaurantInfoApi(locator<Dio>()),
  );

  // register api repo here (must be called after all apis has initialised)
  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(locator<RestaurantsApi>(), locator<LoginApi>(),
        locator<RestaurantInfoApi>()),
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // must be called after Firebase is initiated
  locator.registerSingleton<FirebaseRepository>(
      FirebaseRepositoryImpl(FirebaseAuth.instance));
}
