import 'package:Lopy/src/domain/models/order.dart';
import 'package:equatable/equatable.dart';

class OrderResponse extends Equatable {
  final List<Order> orders;

  const OrderResponse({
    required this.orders,
  });

  Map<String, dynamic> toMap() {
    return {
      'orders': orders,
    };
  }

  factory OrderResponse.fromMap(Map<String, dynamic> map) {
    return OrderResponse(
        orders: List<Order>.from(map['data'].map<Order>(
      (x) => Order.fromJson(x as Map<String, dynamic>),
    )));
  }

  @override
  List<Object> get props => [orders];
}
