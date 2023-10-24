import 'package:equatable/equatable.dart';
import '../restaurant.dart';

class RestaurantsResponse extends Equatable {
  final List<Restaurant> restaurants;

  const RestaurantsResponse({
    required this.restaurants,
  });

  Map<String, dynamic> toMap() {
    return {
      'restaurants': restaurants,
    };
  }

  factory RestaurantsResponse.fromMap(Map<String, dynamic> map) {
    return RestaurantsResponse(
      restaurants: List<Restaurant>.from(
        map['data'].map<Restaurant>(
              (x) => Restaurant.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  @override
  List<Object> get props => [restaurants];
}
