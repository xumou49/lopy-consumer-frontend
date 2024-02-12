class PageRequest {
  final String keyword;
  final int page;
  final int pageSize;
  final int desc;
  final String sort;

  PageRequest(
      {this.keyword = "",
      this.page = 1,
      this.pageSize = 4,
      this.desc = 0,
      this.sort = ""});

  Map<String, dynamic> toMap() {
    return {
      "keyword": keyword,
      "page": page,
      "pageSize": pageSize,
      "desc": desc,
      "sort": sort
    };
  }
}
