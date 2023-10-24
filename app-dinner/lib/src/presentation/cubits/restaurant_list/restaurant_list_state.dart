part of 'restaurant_list_cubit.dart';

abstract class RestaurantListState extends Equatable {
  final List<Restaurant> restaurants;
  final bool isData;
  final DioError? error;

  const RestaurantListState({
    this.restaurants = const [],
    this.isData = true,
    this.error,
  });

  @override
  List<Object?> get props => [restaurants, isData, error];
}

class RestaurantListLoading extends RestaurantListState {
  const RestaurantListLoading();

}

class RestaurantListSuccess extends RestaurantListState {
  const RestaurantListSuccess({super.restaurants, super.isData});
}

class RestaurantListFailed extends RestaurantListState {
  const RestaurantListFailed({super.error});
}

