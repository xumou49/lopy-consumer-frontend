import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final FlutterSecureStorage _secureStorage;
  final String _favRestaurantKey = "fav_restaurants";

  StorageService(this._secureStorage);

  Future<List<int>> getFavRestaurants() async {
    String? jsonString = await _secureStorage.read(key: _favRestaurantKey);
    if (jsonString == null) {
      return [];
    }
    List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.cast<int>();
  }

  Future<void> toggleFavRestaurant(int restaurantsId) async {
    List<int> favRestaurants = await getFavRestaurants();
    if (favRestaurants.contains(restaurantsId)) {
      favRestaurants.remove(restaurantsId);
    } else {
      favRestaurants.add(restaurantsId);
    }
    String jsonString = jsonEncode(favRestaurants);
    await _secureStorage.write(key: _favRestaurantKey, value: jsonString);
  }

  Future<void> clearFavRestaurants() {
    return _secureStorage.delete(key: _favRestaurantKey);
  }
}
