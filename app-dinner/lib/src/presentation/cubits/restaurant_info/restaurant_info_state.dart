part of 'restaurant_info_cubit.dart';

abstract class RestaurantInfoState extends Equatable {
  final Restaurant restaurant;
  final bool isData;
  final DioError? error;

  const RestaurantInfoState({
    this.restaurant = const Restaurant(name: '', imageUrl: '', rating: ''),
    this.isData = true,
    this.error,
  });

  @override
  List<Object?> get props => [restaurant, isData, error];
}

class RestaurantInfoLoading extends RestaurantInfoState {
  const RestaurantInfoLoading();
}

class RestaurantInfoSuccess extends RestaurantInfoState {
  const RestaurantInfoSuccess({super.restaurant, super.isData});
}

class RestaurantInfoFailed extends RestaurantInfoState {
  const RestaurantInfoFailed({super.error});
}
