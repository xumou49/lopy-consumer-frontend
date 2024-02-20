import 'package:equatable/equatable.dart';
import '../restaurant.dart';

class RestaurantsResponse extends Equatable {
  final String msg;
  final int code;
  final List<Restaurant> restaurants;


  const RestaurantsResponse({
    required this.msg,
    required this.code,
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
      msg: (map['msg'] ?? '') as String,
      code: (map['code'] ?? 0)  as int,
    );
  }

  @override
  List<Object> get props => [restaurants];
}
