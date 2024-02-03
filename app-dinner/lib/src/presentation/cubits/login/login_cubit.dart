import 'package:Lopy/src/domain/models/requests/login_request.dart';
import 'package:Lopy/src/domain/models/responses/login_response.dart';
import 'package:Lopy/src/domain/repositories/api_repository.dart';
import 'package:Lopy/src/domain/repositories/firebase_repository.dart';
import 'package:Lopy/src/presentation/cubits/base/base_cubit.dart';
import 'package:Lopy/src/presentation/cubits/login/login_state.dart';
import 'package:Lopy/src/utils/resources/data_state.dart';
import 'package:uuid/uuid.dart';

class LoginCubit extends BaseCubit<LoginState, String> {
  final ApiRepository _apiRepository;
  final FirebaseRepository _firebaseRepository;

  LoginCubit(this._apiRepository, this._firebaseRepository)
      : super(const LoginLoading(), "");

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
      } else if (response is DataFailed) {
        print("fail to send the request to remote server");
        emit(LoginFailed(error: response.error));
      }
    });
  }

  /// not implemented yet, simply emit the success event
  Future<void> appleLogin() async {
    var uuid = Uuid();
    emit(LoginSuccess(token: uuid.v1()));
  }

  Future<void> phoneLogin() async {
    var uuid = Uuid();
    emit(LoginSuccess(token: uuid.v1()));
  }
}
