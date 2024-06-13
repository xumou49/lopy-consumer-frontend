import 'package:Lopy/src/config/routers/app_router.gr.dart';
import 'package:Lopy/src/presentation/cubits/login/login_cubit.dart';
import 'package:Lopy/src/presentation/cubits/login/login_state.dart';
import 'package:Lopy/src/presentation/cubits/user_card/user_card_list_cubit.dart';
import 'package:Lopy/src/presentation/widgets/login/login_button.dart';
import 'package:Lopy/src/presentation/widgets/login/login_method_divider.dart';
import 'package:Lopy/src/utils/constants/strings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            // init users data after login
            context
                .read<UserCardListCubit>()
                .getUserCardList(mastercardPayment);
            context.router.replaceAll([const HomeNavigationView()]);
          } else {
            showToast(
                'Fail to login, please contact the administrator for assistance');
          }
        },
        child: const View());
  }
}

class View extends StatefulWidget {
  const View({super.key});

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                child: Column(children: [
      // image logo
      const SizedBox(
        height: 30,
      ),
      _getLogo(),
      // text info, welcome & description
      _getText("Welcome", const Color(0xFF1F2937), 24, FontWeight.w700),
      const SizedBox(height: 15),
      _getText(
          "Can’t wait to see the menu ? \nSimply sign-in by few clicks and start exploring",
          const Color(0xFF4B5563),
          12,
          FontWeight.w400),
      const SizedBox(height: 80),
      // login button
      LoginButton(
          "Sign in with Google", "lib/src/assets/images/google_login_logo.png",
          onTap: () {
        context.read<LoginCubit>().googleLogin();
      }),
      const SizedBox(height: 24),
      LoginButton(
          "Sign in with Apple", "lib/src/assets/images/apple_login_logo.png",
          onTap: () {
        context.read<LoginCubit>().appleLogin();
      }, textColor: Colors.white, backgroundColor: Colors.black),
      const SizedBox(height: 20),
      const LoginMethodDivider(),
      const SizedBox(height: 20),
      LoginButton(
        "Sign in with Phone Number",
        "lib/src/assets/images/phone_login_logo.png",
        onTap: () {
          context.read<LoginCubit>().phoneLogin();
        },
      ),
    ]))));
  }
}
