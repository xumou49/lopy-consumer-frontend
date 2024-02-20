part of 'restaurant_promo_cubit.dart';

abstract class RestaurantPromoState extends Equatable {
  final List<Restaurant> restaurants;
  final bool isData;
  final DioError? error;

  const RestaurantPromoState({
    this.restaurants = const [],
    this.isData = true,
    this.error,
  });

  @override
  List<Object?> get props => [restaurants, isData, error];
}

class RestaurantPromoLoading extends RestaurantPromoState {
  const RestaurantPromoLoading();

}

class RestaurantPromoSuccess extends RestaurantPromoState {
  const RestaurantPromoSuccess({super.restaurants, super.isData});
}

class RestaurantPromoFailed extends RestaurantPromoState {
  const RestaurantPromoFailed({super.error});
}
