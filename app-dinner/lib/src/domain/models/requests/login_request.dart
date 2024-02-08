class LoginRequest {
  final String token;
  final String phone;

  LoginRequest({this.token = "", this.phone = ""});

  Map<String, dynamic> toMap() {
    return {"token": token, "phone": phone};
  }
}
