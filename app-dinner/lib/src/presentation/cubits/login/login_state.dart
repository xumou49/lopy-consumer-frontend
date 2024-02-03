import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  final String token;
  final DioError? error;

  const LoginState({
    this.token = "",
    this.error,
  });

  @override
  List<Object?> get props => [token, error];
}

class LoginSuccess extends LoginState {
  const LoginSuccess({super.token, super.error});
}

class LoginLoading extends LoginState {
  const LoginLoading();
}

class LoginFailed extends LoginState {
  const LoginFailed({super.error});
}
