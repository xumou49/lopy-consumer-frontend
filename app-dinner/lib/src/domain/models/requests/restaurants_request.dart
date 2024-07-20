class RestaurantListRequest {
  final int page;
  final int pageSize;
  final bool promotionSearch;
  final String cuisine;
  final String name;
  final String action;
  final List<int> idList;

  RestaurantListRequest({
    this.page = 1,
    this.pageSize = 4,
    this.promotionSearch = false,
    this.cuisine = "",
    this.action = "",
    this.name = "",
    this.idList = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'promotionSearch': promotionSearch,
      'cuisine': cuisine,
      'name': name,
      'idList': idList,
      'action': action,
    };
  }

  // Add this method for code generation
  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'promotionSearch': promotionSearch,
      'cuisine': cuisine,
      'name': name,
      'idList': idList,
      'action': action,
    };
  }
}
