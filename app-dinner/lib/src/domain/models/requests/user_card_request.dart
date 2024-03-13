class UserCardRequest {
  final String token;

  UserCardRequest({this.token = ""});

  Map<String, dynamic> toMap() {
    return {
      "token": token,
    };
  }
}
