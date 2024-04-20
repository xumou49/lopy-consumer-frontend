import 'package:Lopy/src/config/routers/app_router.dart';
import 'package:Lopy/src/data/data_sources/remote/login_api.dart';
import 'package:Lopy/src/data/data_sources/remote/order_items_api.dart';
import 'package:Lopy/src/data/data_sources/remote/orders_api.dart';
import 'package:Lopy/src/data/data_sources/remote/restaurant_info_api.dart';
import 'package:Lopy/src/data/data_sources/remote/user_card_api.dart';
import 'package:Lopy/src/data/repositories/auth_repository_impl.dart';
import 'package:Lopy/src/data/repositories/firebase_repository_impl.dart';
import 'package:Lopy/src/domain/repositories/auth_repository.dart';
import 'package:Lopy/src/domain/repositories/firebase_repository.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../firebase_options.dart';
import 'data/data_sources/local/app_database.dart';
import 'data/data_sources/remote/restaurants_api.dart';
import 'data/repositories/api_repository_impl.dart';
import 'data/repositories/database_repository_impl.dart';
import 'domain/repositories/api_repository.dart';
import 'domain/repositories/database_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());

  final secureStorage = const FlutterSecureStorage();

  locator.registerSingleton(AppRouter());
  locator.registerSingleton<Dio>(dio);
  locator.registerSingleton(secureStorage);

  final db = await $FloorAppDatabase.databaseBuilder("app_database.db").build();
  locator.registerSingleton<AppDatabase>(db);

  // register apis here
  locator.registerSingleton<LoginApi>(
    LoginApi(locator<Dio>()),
  );

  locator.registerSingleton<RestaurantsApi>(
    RestaurantsApi(locator<Dio>()),
  );

  locator.registerSingleton<OrdersApi>(
    OrdersApi(locator<Dio>()),
  );

  locator.registerSingleton<OrderItemsApi>(
    OrderItemsApi(locator<Dio>()),
  );

  locator.registerSingleton<RestaurantInfoApi>(
    RestaurantInfoApi(locator<Dio>()),
  );

  locator.registerSingleton<UserCardApi>(
    UserCardApi(locator<Dio>()),
  );

  // register api repo here (must be called after all apis has initialised)
  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(
        locator<LoginApi>(),
        locator<RestaurantsApi>(),
        locator<OrdersApi>(),
        locator<OrderItemsApi>(),
        locator<RestaurantInfoApi>(),
        locator<UserCardApi>()),
  );

  // register auth repo (for token storage)
  locator.registerSingleton<AuthRepository>(
      AuthRepositoryImpl(locator<FlutterSecureStorage>()));

  locator.registerSingleton<DatabaseRepository>(
    DatabaseRepositoryImpl(locator<AppDatabase>()),
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // must be called after Firebase is initiated
  locator.registerSingleton<FirebaseRepository>(
      FirebaseRepositoryImpl(FirebaseAuth.instance));
}
