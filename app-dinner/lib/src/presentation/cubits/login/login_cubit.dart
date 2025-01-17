import 'package:Lopy/src/domain/models/requests/login_request.dart';
import 'package:Lopy/src/domain/repositories/api_repository.dart';
import 'package:Lopy/src/domain/repositories/auth_repository.dart';
import 'package:Lopy/src/domain/repositories/firebase_repository.dart';
import 'package:Lopy/src/presentation/cubits/base/base_cubit.dart';
import 'package:Lopy/src/presentation/cubits/login/login_state.dart';
import 'package:Lopy/src/utils/resources/data_state.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:uuid/uuid.dart';

class LoginCubit extends BaseCubit<LoginState, String> {
  final ApiRepository _apiRepository;
  final FirebaseRepository _firebaseRepository;
  final AuthRepository _authRepository;

  bool login = false;

  bool get isLogin => login;

  LoginCubit(
      this._apiRepository, this._firebaseRepository, this._authRepository)
      : super(const LoginLoading(), "");

  Future<bool> checkIfUserHasLoggedIn() async {
    final token = await _authRepository.getToken();
    if (token == null || token == "") {
      return Future.value(false);
    }
    print("checkIfUserHasLoggedIn, token: $token");
    // check if the token has expired
    Map<String, dynamic> decodedToken;
    try {
      decodedToken = JwtDecoder.decode(token);
      print(decodedToken);
    } catch (e) {
      print("error: $e");
      return Future.value(false);
    }
    if (decodedToken.isEmpty) {
      return Future.value(false);
    }
    DateTime expirationDate = JwtDecoder.getExpirationDate(token);
    print(expirationDate);
    bool isTokenExpired = JwtDecoder.isExpired(token);
    if (isTokenExpired) {
      login = false;
    } else {
      login = true;
    }
    return Future.value(login);
  }

  Future<void> logout() async {
    await _authRepository.removeToken();
    await _firebaseRepository.logout();
    // reset the state to loading
    emit(const LoginLoading());
  }

  Future<void> googleLogin() async {
    if (isBusy) return;

    await run(() async {
      // run the firebase login and get the access token first
      String accessToken =
          await _firebaseRepository.getGoogleLoginAccessToken();
      print("access token: $accessToken");
      // call the api and get the system token
      final response = await _apiRepository.googleLogin(
          request: LoginRequest(token: accessToken));
      if (response is DataSuccess) {
        final loginToken = response.data!.token;
        print("login token: $loginToken");
        emit(LoginSuccess(token: loginToken));
        _saveToken(loginToken);
      } else if (response is DataFailed) {
        print("fail to send the request to remote server");
        emit(LoginFailed(error: response.error));
      }
    });
  }

  void _saveToken(String token) {
    _authRepository.saveToken(token);
  }

  /// not implemented yet, simply emit the success event
  Future<void> appleLogin() async {
    var uuid = const Uuid();
    String token = uuid.v1();
    emit(LoginSuccess(token: token));
    _saveToken(token);
  }

  Future<void> phoneLogin() async {
    var uuid = const Uuid();
    String token = uuid.v1();
    emit(LoginSuccess(token: uuid.v1()));
    _saveToken(token);
  }
}
