import 'dart:io';

import 'package:Lopy/src/domain/repositories/firebase_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  late final FirebaseAuth _auth;

  final String iosPlatformClientId =
      "296683188665-v76n9m79o953rp2gppa7qm9c7gc0jd29.apps.googleusercontent.com";
  final String androidPlatformClientId =
      "296683188665-g6rk2r25radibpiv8k3bov9volvjiqnn.apps.googleusercontent.com";

  late final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    "email",
    "https://www.googleapis.com/auth/contacts.readonly",
  ], clientId: Platform.isAndroid ? androidPlatformClientId : iosPlatformClientId);

  FirebaseRepositoryImpl(this._auth);

  @override
  Future<String> getGoogleLoginAccessToken() async {
    print("running firebase google sign-in");
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print("fail to do google sign-in");
        return Future(() => "");
      }
      // the authentication should be carried out in backend, as long as accessToken is obtained, send request to backend
      // no need to bother the idToken, as it is meant to be consumed by client application
      GoogleSignInAuthentication auth = await googleUser.authentication;
      return Future<String>.value(auth.accessToken);
    } catch (e) {
      print("exception from firebase sdk, ${e.toString()}");
      return Future(() => "");
    }
  }

  /// used this method to validate th token, if it is client-sign-in
  void _verifyGoogleSignIdToken(GoogleSignInAuthentication googleAuth) async {
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    final User? firebaseUser =
        (await _auth.signInWithCredential(authCredential)).user;
    if (firebaseUser == null) {
      // log and return
      print("fail to get firebase user");
      return;
    }
    // check if user info is not empty
    if (firebaseUser.email == null) {
      print("user email is not found ...");
      return;
    }
    if (firebaseUser.displayName == null) {
      print("user name is not found ...");
      return;
    }
    if (firebaseUser.isAnonymous) {
      print("user is anonymous ...");
      return;
    }
    IdTokenResult idTokenResult = await firebaseUser.getIdTokenResult();
    // setState(() {
    //   _googleIdToken = idTokenResult.token;
    // });
    print(authCredential.accessToken);
    print(idTokenResult.token);
  }
}
