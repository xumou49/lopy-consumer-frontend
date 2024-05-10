class RestaurantListRequest {
  final int page;
  final int pageSize;
  final bool promotionSearch;
  final String cuisine;
  final String name;

  RestaurantListRequest({
    this.page = 1,
    this.pageSize = 4,
    this.promotionSearch = false,
    this.cuisine = "",
    this.name = "",
  });

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'promotionSearch': promotionSearch,
      'cuisine': cuisine,
      'name': name,
    };
  }

  // Add this method for code generation
  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'promotionSearch': promotionSearch,
      'cuisine': cuisine,
      'name': name,
    };
  }
}
