import 'package:Lopy/firebase_options.dart';
import 'package:Lopy/src/config/routers/app_router.dart';
import 'package:Lopy/src/domain/repositories/api_repository.dart';
import 'package:Lopy/src/presentation/cubits/restaurant_list/restaurant_list_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'src/locator.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
          )..getRestaurantList(),
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
