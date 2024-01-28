import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:Lopy/src/presentation/widgets/login/login_button.dart';
import 'package:Lopy/src/presentation/widgets/login/login_method_divider.dart';
import 'package:google_sign_in/google_sign_in.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final String iosPlatformClientId =
      "296683188665-v76n9m79o953rp2gppa7qm9c7gc0jd29.apps.googleusercontent.com";

  late FirebaseAuth _auth;

  late GoogleSignIn _googleSignIn = _googleSignIn = GoogleSignIn(scopes: [
    "email",
    "https://www.googleapis.com/auth/contacts.readonly",
  ], clientId: iosPlatformClientId);

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
  }

  Widget _getLogo() {
    return Container(
      width: 316,
      height: 260,
      margin: const EdgeInsets.fromLTRB(0, 60, 0, 70),
      child: Image.asset("lib/src/assets/images/login_food_logo.png",
          fit: BoxFit.contain),
    );
  }

  Widget _getText(
      String content, Color color, double fontSize, FontWeight fontWeight) {
    return Text(content,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: 'Montserrat',
          fontWeight: fontWeight,
        ));
  }

  void _googleSignInHandler() async {
    print("click google sign-in");
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print("fail to do google sign-in");
        return;
      }
      // the authentication should be carried out in backend, as long as accessToken is obtained, send request to backend
      // no need to bother the idToken, as it is meant to be consumed by client application
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      print("access Token: ${googleAuth.accessToken}");
    } catch (e) {
      print("exception from firebase sdk, ${e.toString()}");
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                child: Column(children: [
      // image logo
      _getLogo(),
      // text info, welcome & description
      _getText("Welcome", const Color(0xFF1F2937), 24, FontWeight.w700),
      const SizedBox(height: 15),
      _getText(
          "Can’t wait to see the menu ? \nSimply sign-in by few clicks and start exploring",
          const Color(0xFF4B5563),
          12,
          FontWeight.w400),
      const SizedBox(height: 130),
      // login button
      LoginButton(
          "Sign in with Google", "lib/src/assets/images/google_login_logo.png",
          onTap: _googleSignInHandler),
      const SizedBox(height: 24),
      LoginButton(
          "Sign in with Apple", "lib/src/assets/images/apple_login_logo.png",
          onTap: () {
        print("click apple login");
      }, textColor: Colors.white, backgroundColor: Colors.black),
      const SizedBox(height: 40),
      const LoginMethodDivider(),
      const SizedBox(height: 40),
      LoginButton(
        "Sign in with Phone Number",
        "lib/src/assets/images/phone_login_logo.png",
        onTap: () {
          print("click phone login");
        },
      ),
    ]))));
  }
}
