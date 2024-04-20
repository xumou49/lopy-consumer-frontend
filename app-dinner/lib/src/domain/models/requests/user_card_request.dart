class UserCardRequest {
  UserCardRequest();

  Map<String, dynamic> toMap() {
    return {
      "": "",
    };
  }
}

class UserCardListRequest {
  final String? brand;

  UserCardListRequest({this.brand});

  Map<String, dynamic> toMap() {
    return {
      "brand": brand,
    };
  }
}
