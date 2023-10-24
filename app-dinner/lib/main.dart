import 'package:Lopy/src/config/routers/app_router.dart';
import 'package:Lopy/src/domain/repositories/api_repository.dart';
import 'package:Lopy/src/presentation/cubits/restaurant_list/restaurant_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'src/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(const LopyApp());
}

class LopyApp extends StatelessWidget {
  const LopyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
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
            colorScheme:
                // ColorScheme.fromSeed(seedColor: const Color.fromRGBO(243, 129, 129, 1)),
                ColorScheme.fromSeed(seedColor: Colors.pinkAccent.shade700),
            useMaterial3: true,
          ),
        ),
      ),
    );

    MaterialApp.router(
      routerConfig: appRouter.config(),
      title: 'Lopy',
      theme: ThemeData(
        colorScheme:
            // ColorScheme.fromSeed(seedColor: const Color.fromRGBO(243, 129, 129, 1)),
            ColorScheme.fromSeed(seedColor: Colors.pinkAccent.shade700),
        useMaterial3: true,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lopy',
      theme: ThemeData(
        colorScheme:
            // ColorScheme.fromSeed(seedColor: const Color.fromRGBO(243, 129, 129, 1)),
            ColorScheme.fromSeed(seedColor: Colors.pinkAccent.shade700),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'lopy',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int idx) {
    setState(() {
      _selectedIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text(
          'Home',
          style:
              TextStyle(fontSize: 50, color: Color.fromRGBO(243, 129, 129, 1)),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Discover"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Orders"),
          BottomNavigationBarItem(icon: Icon(Icons.scanner), label: "Scan"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me"),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
