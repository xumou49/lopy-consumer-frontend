abstract class FirebaseRepository {
  Future<String> getGoogleLoginAccessToken();

  Future<void> logout();
}
