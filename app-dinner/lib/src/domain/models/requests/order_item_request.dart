class OrderItemListRequest {
  final num orderId;

  OrderItemListRequest({required this.orderId});

  Map<String, dynamic> toMap() {
    return {"orderId": orderId};
  }
}
