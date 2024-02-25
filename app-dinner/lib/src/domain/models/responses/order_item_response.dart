import 'package:Lopy/src/domain/models/order_item.dart';
import 'package:equatable/equatable.dart';

class OrderItemListResponse extends Equatable {
  final List<OrderItem> orderItems;

  const OrderItemListResponse({
    required this.orderItems,
  });

  Map<String, dynamic> toMap() {
    return {
      'orderItems': orderItems,
    };
  }

  factory OrderItemListResponse.fromMap(Map<String, dynamic> map) {
    return OrderItemListResponse(
        orderItems: List<OrderItem>.from(map['data'].map<OrderItem>(
      (x) => OrderItem.fromJson(x as Map<String, dynamic>),
    )));
  }

  @override
  List<Object> get props => [orderItems];
}
