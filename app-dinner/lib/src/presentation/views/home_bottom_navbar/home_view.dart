import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../config/routers/app_router.gr.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        DiscoverNavigationView(),
        OrderNavigationView(),
        ScanNavigationView(),
        ProfileNavigationView()
      ],
      builder: (context, child) {
        final tabRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabRouter.activeIndex,
            onTap: (value) {
              tabRouter.setActiveIndex(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Color.fromRGBO(243, 129, 129, 1),
                ),
                label: "Discover",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message,
                      color: Color.fromRGBO(243, 129, 129, 1)),
                  label: "Orders"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.scanner,
                      color: Color.fromRGBO(243, 129, 129, 1)),
                  label: "Scan"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person,
                      color: Color.fromRGBO(243, 129, 129, 1)),
                  label: "Me"),
            ],
          ),
        );
      },
    );
  }
}

/*
 *flow 1: start page animation -> login page -> (google/apple/phone popup) -> home
 *flow 2: Home page -> search bar -> search page -> Restaurant list Page -> Restaurant Page -> Menu detail(add/cancel) -> Restaurant page -> cart page -> place order
				  -> Home Promotion sector -> view all button -> Restaurant list Page -> Restaurant Page -> Menu detail(add/cancel) -> Restaurant page -> cart page -> place order
					  					   -> Restaurant Page -> Menu detail(add/cancel) -> Restaurant page -> cart page -> place order
				  -> Home Category sector -> Restaurant list Page -> Restaurant Page -> Menu detail(add/cancel) -> Restaurant page -> cart page -> place order
				  -> Home Recommandation sector -> Restaurant Page -> Menu detail -> Restaurant page -> cart page -> place order
*/
