
class RestaurantListRequest {
  final int page;
  final int pageSize;
  final bool promotionSearch;
  final String cuisine;

  RestaurantListRequest({
    this.page = 1,
    this.pageSize = 4,
    this.promotionSearch = false,
    this.cuisine = "",
  });

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'promotionSearch': promotionSearch,
      'cuisine': cuisine
    };
  }

  // Add this method for code generation
  Map<String, dynamic> toMap() {
    return {
      'page': page,
      'promotionSearch': promotionSearch,
      'cuisine': cuisine
    };
  }
}
