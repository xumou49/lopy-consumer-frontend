class UserCardRequest {
  final String cardToken;

  UserCardRequest({required this.cardToken});

  Map<String, dynamic> toMap() {
    return {
      "cardToken": cardToken,
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
