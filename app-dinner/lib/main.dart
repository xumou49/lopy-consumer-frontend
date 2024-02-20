import 'dart:io';

import 'package:Lopy/src/config/routers/app_router.dart';
import 'package:Lopy/src/domain/repositories/api_repository.dart';
import 'package:Lopy/src/domain/repositories/firebase_repository.dart';
import 'package:Lopy/src/presentation/cubits/login/login_cubit.dart';
import 'package:Lopy/src/presentation/cubits/order/order_list_cubit.dart';
import 'package:Lopy/src/presentation/cubits/restaurant_list/restaurant_cuisine_cubit.dart';
import 'package:Lopy/src/presentation/cubits/restaurant_list/restaurant_list_cubit.dart';
import 'package:Lopy/src/presentation/cubits/restaurant_list/restaurant_promo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

import 'src/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await initializeDependencies();

  runApp(const LopyApp());
}

class LopyApp extends StatelessWidget {
  const LopyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = GetIt.I.get<AppRouter>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          RestaurantListCubit(
            locator<ApiRepository>(),
          )
            ..getRestaurantList(),
        ),
        BlocProvider(
            create: (context) =>
                LoginCubit(
                    locator<ApiRepository>(), locator<FirebaseRepository>())),
        BlocProvider(
            create: (context) => OrderListCubit(locator<ApiRepository>())
        ),
        BlocProvider(
          create: (context) =>
          RestaurantPromoCubit(
            locator<ApiRepository>(),
          )
            ..getRestaurantList(),),
        BlocProvider(
          create: (context) =>
          RestaurantCuisineCubit(
            locator<ApiRepository>(),
          )
            ..getRestaurantList(),
        )
      ],

      child: OKToast(
        child: MaterialApp.router(
          // routerConfig: appRouter.config(),
          routerDelegate: appRouter.delegate(),
          routeInformationParser: appRouter.defaultRouteParser(),
          title: 'Lopy',
          theme: ThemeData(
            // colorScheme:
            // ColorScheme.fromSeed(seedColor: const Color.fromRGBO(243, 129, 129, 1)),
            // ColorScheme.fromSeed(seedColor: Colors.pinkAccent.shade700),
            useMaterial3: true,
          ),
        ),
      ),
    );
  }
}

// for testing purpose, to see the transition changes of bloc
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host,
          int port) => true;
  }
}
