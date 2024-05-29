part of 'restaurant_search_cubit.dart';

abstract class RestaurantSearchState<T> extends Equatable {
  final List<Restaurant> restaurants;

  const RestaurantSearchState({
    this.restaurants = const [],
  });

  @override
  List<Object?> get props => [restaurants];
}

class RestaurantResultDefaultState extends RestaurantSearchState {
  const RestaurantResultDefaultState({super.restaurants});
}

class RestaurantResultEmptyState extends RestaurantSearchState {
  const RestaurantResultEmptyState({super.restaurants});
}

class RestaurantResultAvailableState extends RestaurantSearchState {
  const RestaurantResultAvailableState({super.restaurants});
}
