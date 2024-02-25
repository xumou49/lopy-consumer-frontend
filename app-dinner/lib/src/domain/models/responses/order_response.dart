import 'package:Lopy/src/domain/models/order.dart';
import 'package:equatable/equatable.dart';

class OrderListResponse extends Equatable {
  final List<Order> orders;

  const OrderListResponse({
    required this.orders,
  });

  Map<String, dynamic> toMap() {
    return {
      'orders': orders,
    };
  }

  factory OrderListResponse.fromMap(Map<String, dynamic> map) {
    return OrderListResponse(
        orders: List<Order>.from(map['data'].map<Order>(
      (x) => Order.fromJson(x as Map<String, dynamic>),
    )));
  }

  @override
  List<Object> get props => [orders];
}
