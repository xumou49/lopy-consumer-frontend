import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final String token;

  const LoginResponse({
    required this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(token: map["data"]);
  }

  @override
  List<Object> get props => [token];
}
