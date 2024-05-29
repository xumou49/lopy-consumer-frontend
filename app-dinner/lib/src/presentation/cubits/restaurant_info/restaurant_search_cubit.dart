import 'package:Lopy/src/domain/models/requests/restaurants_request.dart';
import 'package:Lopy/src/domain/models/restaurant.dart';
import 'package:Lopy/src/domain/repositories/api_repository.dart';
import 'package:Lopy/src/presentation/cubits/base/base_cubit.dart';
import 'package:Lopy/src/utils/resources/data_state.dart';
import 'package:equatable/equatable.dart';

part 'restaurant_search_state.dart';

class RestaurantSearchCubit
    extends BaseCubit<RestaurantSearchState, List<Restaurant>> {
  final ApiRepository _apiRepository;

  RestaurantSearchCubit(this._apiRepository)
      : super(const RestaurantResultDefaultState(), []);

  Future<void> getHistoryByKeyword(String keyword) async {
    if (isBusy) return;

    await run(() async {
      // check if keyword has matched with any historical search (todo)
      keyword = keyword.toLowerCase().trim();
      if (keyword == "") {
        emit(const RestaurantResultDefaultState());
        return;
      }
    });
  }

  int _page = 1;

  Future<void> getRestaurantsByKeyword(String keyword) async {
    if (isBusy) return;

    await run(() async {
      keyword = keyword.toLowerCase().trim();
      if (keyword == "") {
        emit(const RestaurantResultDefaultState());
        return;
      }

      final response = await _apiRepository.getRestaurantList(
          request: RestaurantListRequest(
              page: _page, promotionSearch: false, cuisine: "", name: keyword));
      if (response is DataSuccess) {
        final restaurants = response.data!.restaurants;
        if (restaurants.isEmpty) {
          emit(const RestaurantResultEmptyState(restaurants: []));
          return;
        }
        data.addAll(restaurants);
        _page++;
        emit(RestaurantResultAvailableState(restaurants: restaurants));
        return;
      }
      emit(RestaurantResultEmptyState(restaurants: []));
    });
  }
}
