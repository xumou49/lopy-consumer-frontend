// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i27;
import 'package:Lopy/src/presentation/views/cart/cart_item_view.dart' as _i1;
import 'package:Lopy/src/presentation/views/cart/cart_list_view.dart' as _i2;
import 'package:Lopy/src/presentation/views/home_bottom_navbar/discover/discover_view.dart' as _i5;
import 'package:Lopy/src/presentation/views/home_bottom_navbar/home_view.dart' as _i7;
import 'package:Lopy/src/presentation/views/login/login_view.dart' as _i9;
import 'package:Lopy/src/presentation/views/login/start_app_animation_view.dart'
    as _i25;
import 'package:Lopy/src/presentation/views/navigation/cart_navigation_view.dart'
    as _i3;
import 'package:Lopy/src/presentation/views/navigation/discover_navigation_view.dart'
    as _i4;
import 'package:Lopy/src/presentation/views/navigation/home_navigation_view.dart'
    as _i6;
import 'package:Lopy/src/presentation/views/navigation/login_navigation_view.dart'
    as _i8;
import 'package:Lopy/src/presentation/views/navigation/order_navigation_view.dart'
    as _i11;
import 'package:Lopy/src/presentation/views/navigation/place_order_navigation.dart'
    as _i13;
import 'package:Lopy/src/presentation/views/navigation/profile_navigation_view.dart'
    as _i15;
import 'package:Lopy/src/presentation/views/navigation/restaurants_navigation_view.dart'
    as _i20;
import 'package:Lopy/src/presentation/views/navigation/scan_navigation_view.dart'
    as _i21;
import 'package:Lopy/src/presentation/views/navigation/search_navigation_view.dart'
    as _i23;
import 'package:Lopy/src/presentation/views/navigation/start_app_animation_navigation_view.dart'
    as _i26;
import 'package:Lopy/src/presentation/views/home_bottom_navbar/orders/order_detail_view.dart'
    as _i10;
import 'package:Lopy/src/presentation/views/home_bottom_navbar/orders/orders_view.dart' as _i12;
import 'package:Lopy/src/presentation/views/place_order/place_order.dart'
    as _i14;
import 'package:Lopy/src/presentation/views/home_bottom_navbar/profile/profile_view.dart' as _i16;
import 'package:Lopy/src/presentation/views/restaurant/restaurant_detail_view.dart'
    as _i17;
import 'package:Lopy/src/presentation/views/restaurant/restaurant_list_view.dart'
    as _i18;
import 'package:Lopy/src/presentation/views/restaurant/restaurant_menu_item_view.dart'
    as _i19;
import 'package:Lopy/src/presentation/views/home_bottom_navbar/scan/scan_view.dart' as _i22;
import 'package:Lopy/src/presentation/views/search/search_view.dart' as _i24;

abstract class $AppRouter extends _i27.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i27.PageFactory> pagesMap = {
    CartItemView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CartItemView(),
      );
    },
    CartListView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CartListView(),
      );
    },
    CartNavigationView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.CartNavigationView(),
      );
    },
    DiscoverNavigationView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DiscoverNavigationView(),
      );
    },
    DiscoverView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DiscoverView(),
      );
    },
    HomeNavigationView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeNavigationView(),
      );
    },
    HomeView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomeView(),
      );
    },
    LoginNavigationView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LoginNavigationView(),
      );
    },
    LoginView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.LoginView(),
      );
    },
    OrderDetailView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.OrderDetailView(),
      );
    },
    OrderNavigationView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.OrderNavigationView(),
      );
    },
    OrdersView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.OrdersView(),
      );
    },
    PlaceOrderNavigationView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.PlaceOrderNavigationView(),
      );
    },
    PlaceOrderView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.PlaceOrderView(),
      );
    },
    ProfileNavigationView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.ProfileNavigationView(),
      );
    },
    ProfileView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.ProfileView(),
      );
    },
    RestaurantDetailView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.RestaurantDetailView(),
      );
    },
    RestaurantListView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.RestaurantListView(),
      );
    },
    RestaurantMenuItemView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.RestaurantMenuItemView(),
      );
    },
    RestaurantsNavigationView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.RestaurantsNavigationView(),
      );
    },
    ScanNavigationView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.ScanNavigationView(),
      );
    },
    ScanView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.ScanView(),
      );
    },
    SearchNavigationView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.SearchNavigationView(),
      );
    },
    SearchView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.SearchView(),
      );
    },
    StartAppAnimationView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.StartAppAnimationView(),
      );
    },
    StartAppNavigationNavigationView.name: (routeData) {
      return _i27.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.StartAppNavigationNavigationView(),
      );
    },
  };
}

/// generated route for
/// [_i1.CartItemView]
class CartItemView extends _i27.PageRouteInfo<void> {
  const CartItemView({List<_i27.PageRouteInfo>? children})
      : super(
          CartItemView.name,
          initialChildren: children,
        );

  static const String name = 'CartItemView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CartListView]
class CartListView extends _i27.PageRouteInfo<void> {
  const CartListView({List<_i27.PageRouteInfo>? children})
      : super(
          CartListView.name,
          initialChildren: children,
        );

  static const String name = 'CartListView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i3.CartNavigationView]
class CartNavigationView extends _i27.PageRouteInfo<void> {
  const CartNavigationView({List<_i27.PageRouteInfo>? children})
      : super(
          CartNavigationView.name,
          initialChildren: children,
        );

  static const String name = 'CartNavigationView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DiscoverNavigationView]
class DiscoverNavigationView extends _i27.PageRouteInfo<void> {
  const DiscoverNavigationView({List<_i27.PageRouteInfo>? children})
      : super(
          DiscoverNavigationView.name,
          initialChildren: children,
        );

  static const String name = 'DiscoverNavigationView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DiscoverView]
class DiscoverView extends _i27.PageRouteInfo<void> {
  const DiscoverView({List<_i27.PageRouteInfo>? children})
      : super(
          DiscoverView.name,
          initialChildren: children,
        );

  static const String name = 'DiscoverView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeNavigationView]
class HomeNavigationView extends _i27.PageRouteInfo<void> {
  const HomeNavigationView({List<_i27.PageRouteInfo>? children})
      : super(
          HomeNavigationView.name,
          initialChildren: children,
        );

  static const String name = 'HomeNavigationView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomeView]
class HomeView extends _i27.PageRouteInfo<void> {
  const HomeView({List<_i27.PageRouteInfo>? children})
      : super(
          HomeView.name,
          initialChildren: children,
        );

  static const String name = 'HomeView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LoginNavigationView]
class LoginNavigationView extends _i27.PageRouteInfo<void> {
  const LoginNavigationView({List<_i27.PageRouteInfo>? children})
      : super(
          LoginNavigationView.name,
          initialChildren: children,
        );

  static const String name = 'LoginNavigationView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoginView]
class LoginView extends _i27.PageRouteInfo<void> {
  const LoginView({List<_i27.PageRouteInfo>? children})
      : super(
          LoginView.name,
          initialChildren: children,
        );

  static const String name = 'LoginView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i10.OrderDetailView]
class OrderDetailView extends _i27.PageRouteInfo<void> {
  const OrderDetailView({List<_i27.PageRouteInfo>? children})
      : super(
          OrderDetailView.name,
          initialChildren: children,
        );

  static const String name = 'OrderDetailView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i11.OrderNavigationView]
class OrderNavigationView extends _i27.PageRouteInfo<void> {
  const OrderNavigationView({List<_i27.PageRouteInfo>? children})
      : super(
          OrderNavigationView.name,
          initialChildren: children,
        );

  static const String name = 'OrderNavigationView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i12.OrdersView]
class OrdersView extends _i27.PageRouteInfo<void> {
  const OrdersView({List<_i27.PageRouteInfo>? children})
      : super(
          OrdersView.name,
          initialChildren: children,
        );

  static const String name = 'OrdersView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i13.PlaceOrderNavigationView]
class PlaceOrderNavigationView extends _i27.PageRouteInfo<void> {
  const PlaceOrderNavigationView({List<_i27.PageRouteInfo>? children})
      : super(
          PlaceOrderNavigationView.name,
          initialChildren: children,
        );

  static const String name = 'PlaceOrderNavigationView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i14.PlaceOrderView]
class PlaceOrderView extends _i27.PageRouteInfo<void> {
  const PlaceOrderView({List<_i27.PageRouteInfo>? children})
      : super(
          PlaceOrderView.name,
          initialChildren: children,
        );

  static const String name = 'PlaceOrderView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i15.ProfileNavigationView]
class ProfileNavigationView extends _i27.PageRouteInfo<void> {
  const ProfileNavigationView({List<_i27.PageRouteInfo>? children})
      : super(
          ProfileNavigationView.name,
          initialChildren: children,
        );

  static const String name = 'ProfileNavigationView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i16.ProfileView]
class ProfileView extends _i27.PageRouteInfo<void> {
  const ProfileView({List<_i27.PageRouteInfo>? children})
      : super(
          ProfileView.name,
          initialChildren: children,
        );

  static const String name = 'ProfileView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i17.RestaurantDetailView]
class RestaurantDetailView extends _i27.PageRouteInfo<void> {
  const RestaurantDetailView({List<_i27.PageRouteInfo>? children})
      : super(
          RestaurantDetailView.name,
          initialChildren: children,
        );

  static const String name = 'RestaurantDetailView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i18.RestaurantListView]
class RestaurantListView extends _i27.PageRouteInfo<void> {
  const RestaurantListView({List<_i27.PageRouteInfo>? children})
      : super(
          RestaurantListView.name,
          initialChildren: children,
        );

  static const String name = 'RestaurantListView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i19.RestaurantMenuItemView]
class RestaurantMenuItemView extends _i27.PageRouteInfo<void> {
  const RestaurantMenuItemView({List<_i27.PageRouteInfo>? children})
      : super(
          RestaurantMenuItemView.name,
          initialChildren: children,
        );

  static const String name = 'RestaurantMenuItemView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i20.RestaurantsNavigationView]
class RestaurantsNavigationView extends _i27.PageRouteInfo<void> {
  const RestaurantsNavigationView({List<_i27.PageRouteInfo>? children})
      : super(
          RestaurantsNavigationView.name,
          initialChildren: children,
        );

  static const String name = 'RestaurantsNavigationView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i21.ScanNavigationView]
class ScanNavigationView extends _i27.PageRouteInfo<void> {
  const ScanNavigationView({List<_i27.PageRouteInfo>? children})
      : super(
          ScanNavigationView.name,
          initialChildren: children,
        );

  static const String name = 'ScanNavigationView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i22.ScanView]
class ScanView extends _i27.PageRouteInfo<void> {
  const ScanView({List<_i27.PageRouteInfo>? children})
      : super(
          ScanView.name,
          initialChildren: children,
        );

  static const String name = 'ScanView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SearchNavigationView]
class SearchNavigationView extends _i27.PageRouteInfo<void> {
  const SearchNavigationView({List<_i27.PageRouteInfo>? children})
      : super(
          SearchNavigationView.name,
          initialChildren: children,
        );

  static const String name = 'SearchNavigationView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i24.SearchView]
class SearchView extends _i27.PageRouteInfo<void> {
  const SearchView({List<_i27.PageRouteInfo>? children})
      : super(
          SearchView.name,
          initialChildren: children,
        );

  static const String name = 'SearchView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i25.StartAppAnimationView]
class StartAppAnimationView extends _i27.PageRouteInfo<void> {
  const StartAppAnimationView({List<_i27.PageRouteInfo>? children})
      : super(
          StartAppAnimationView.name,
          initialChildren: children,
        );

  static const String name = 'StartAppAnimationView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}

/// generated route for
/// [_i26.StartAppNavigationNavigationView]
class StartAppNavigationNavigationView extends _i27.PageRouteInfo<void> {
  const StartAppNavigationNavigationView({List<_i27.PageRouteInfo>? children})
      : super(
          StartAppNavigationNavigationView.name,
          initialChildren: children,
        );

  static const String name = 'StartAppNavigationNavigationView';

  static const _i27.PageInfo<void> page = _i27.PageInfo<void>(name);
}
