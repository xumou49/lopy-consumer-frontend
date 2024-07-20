import 'package:Lopy/env.dart';
import 'package:Lopy/src/config/routers/app_router.dart';
import 'package:Lopy/src/domain/repositories/api_repository.dart';
import 'package:Lopy/src/domain/repositories/auth_repository.dart';
import 'package:Lopy/src/domain/repositories/database_repository.dart';
import 'package:Lopy/src/domain/repositories/firebase_repository.dart';
import 'package:Lopy/src/presentation/cubits/cart/cart_list_cubit.dart';
import 'package:Lopy/src/presentation/cubits/history/history_keyword_list_cubit.dart';
import 'package:Lopy/src/presentation/cubits/login/login_cubit.dart';
import 'package:Lopy/src/presentation/cubits/order/order_history_list_cubit.dart';
import 'package:Lopy/src/presentation/cubits/order/order_item_list_cubit.dart';
import 'package:Lopy/src/presentation/cubits/order/order_list_cubit.dart';
import 'package:Lopy/src/presentation/cubits/order/order_place_cubit.dart';
import 'package:Lopy/src/presentation/cubits/payment/payment_method_selector_cubit.dart';
import 'package:Lopy/src/presentation/cubits/restaurant_info/restaurant_info_cubit.dart';
import 'package:Lopy/src/presentation/cubits/restaurant_info/restaurant_search_cubit.dart';
import 'package:Lopy/src/presentation/cubits/restaurant_list/restaurant_cuisine_cubit.dart';
import 'package:Lopy/src/presentation/cubits/restaurant_list/restaurant_list_cubit.dart';
import 'package:Lopy/src/presentation/cubits/restaurant_list/restaurant_promo_cubit.dart';
import 'package:Lopy/src/presentation/cubits/user_card/user_card_cubit.dart';
import 'package:Lopy/src/presentation/cubits/user_card/user_card_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

import 'src/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publishableKey;
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
          create: (context) => RestaurantListCubit(
            locator<ApiRepository>(),
            locator<AuthRepository>(),
          )..getRestaurantList(),
        ),
        BlocProvider(
            create: (context) => LoginCubit(locator<ApiRepository>(),
                locator<FirebaseRepository>(), locator<AuthRepository>())),
        BlocProvider(
            create: (context) => OrderListCubit(
                locator<ApiRepository>(), locator<AuthRepository>())
              ..getOrderList(1, 20)),
        BlocProvider(
          create: (context) => OrderHistoryListCubit(
            locator<ApiRepository>(),
            locator<AuthRepository>(),
          ),
        ),
        BlocProvider(
            create: (context) => OrderItemListCubit(
                locator<ApiRepository>(), locator<AuthRepository>())),
        BlocProvider(
            create: (context) => OrderPlaceCubit(
                locator<ApiRepository>(), locator<AuthRepository>())),
        BlocProvider(
            create: (context) => PaymentMethodSelectorCubit(
                locator<ApiRepository>(), locator<AuthRepository>())),
        BlocProvider(
          create: (context) => RestaurantInfoCubit(
            locator<ApiRepository>(),
            locator<AuthRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => RestaurantPromoCubit(
            locator<ApiRepository>(),
            locator<AuthRepository>(),
          )..getRestaurantList(),
        ),
        BlocProvider(
          create: (context) => RestaurantCuisineCubit(
            locator<ApiRepository>(),
            locator<AuthRepository>(),
          )..getRestaurantList(),
        ),
        BlocProvider(
          create: (context) => CartListCubit(
            locator<DatabaseRepository>(),
            locator<AuthRepository>(),
          )..getAllSavedCarts(),
        ),
        BlocProvider(
          create: (context) => UserCardCubit(
            locator<ApiRepository>(),
            locator<AuthRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => HistoryKeywordListCubit(
            locator<ApiRepository>(),
            locator<AuthRepository>(),
          )..getHistoryKeywordList(),
        ),
        BlocProvider(
          create: (context) => UserCardListCubit(
            locator<ApiRepository>(),
            locator<AuthRepository>(),
          ),
        ),
        BlocProvider(
            create: (context) => RestaurantSearchCubit(
                locator<ApiRepository>(), locator<AuthRepository>())),
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
