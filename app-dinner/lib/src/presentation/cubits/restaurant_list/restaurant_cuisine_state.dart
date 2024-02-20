part of 'restaurant_cuisine_cubit.dart';

abstract class RestaurantCuisineState extends Equatable {
  final List<Restaurant> restaurants;
  final bool isData;
  final DioError? error;

  const RestaurantCuisineState({
    this.restaurants = const [],
    this.isData = true,
    this.error,
  });

  @override
  List<Object?> get props => [restaurants, isData, error];
}

class RestaurantCuisineLoading extends RestaurantCuisineState {
  const RestaurantCuisineLoading();

}

class RestaurantCuisineSuccess extends RestaurantCuisineState {
  const RestaurantCuisineSuccess({super.restaurants, super.isData});
}

class RestaurantCuisineFailed extends RestaurantCuisineState {
  const RestaurantCuisineFailed({super.error});
}
