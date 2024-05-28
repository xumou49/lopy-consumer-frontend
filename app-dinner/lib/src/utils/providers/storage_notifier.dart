import 'package:Lopy/src/utils/services/storage_service.dart';
import 'package:flutter/cupertino.dart';

import '../../locator.dart';

class StorageNotifier extends ValueNotifier<List<int>> {
  final _storageService = locator<StorageService>();

  StorageNotifier() : super([]) {
    loadFavoriteRestaurants();
  }

  Future<void> loadFavoriteRestaurants() async {
    value = await _storageService.getFavRestaurants();
  }

  void toggleFavRestaurant(int restaurantId) {
    final favRestaurants = value.contains(restaurantId);
    if (favRestaurants) {
      value.remove(restaurantId);
    } else {
      value.add(restaurantId);
    }
    _storageService.toggleFavRestaurant(restaurantId);
    notifyListeners();
  }
}

final storageNotifier = StorageNotifier();
