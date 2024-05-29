import 'package:Lopy/src/presentation/cubits/login/login_cubit.dart';
import 'package:Lopy/src/presentation/widgets/common/dialog_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';

import '../../../config/routers/app_router.gr.dart';
import '../common/placeholder_widget.dart';

class ProfileSettingsWidget extends StatelessWidget {
  const ProfileSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Align(
            alignment: Alignment.center,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                  height: 365,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // Container background color
                    // borderRadius: BorderRadius.circular(10), // Optional: Add border radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // Shadow color
                        spreadRadius: 5, // Spread radius
                        blurRadius: 7, // Blur radius
                        offset:
                            const Offset(0, 3), // Offset (horizontal, vertical)
                      ),
                    ],
                  ),
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    children: const <Widget>[
                      _SettingsWidget(),
                      _PaymentMethodsWidget(),
                      _FavRestaurantsWidget(),
                      _PrivacyPolicyWidget(),
                      _LogoutWidget()
                    ],
                  )),
            )),
        const PlaceholderWidget(
          height: 25,
        ),
        Align(
            alignment: Alignment.center,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: Container(
                  height: 115,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // Container background color
                    // borderRadius: BorderRadius.circular(10), // Optional: Add border radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2), // Shadow color
                        spreadRadius: 5, // Spread radius
                        blurRadius: 7, // Blur radius
                        offset:
                            const Offset(0, 3), // Offset (horizontal, vertical)
                      ),
                    ],
                  ),
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    children: const <Widget>[
                      _HelpSupportWidget(),
                      _AboutAppWidget()
                    ],
                  )),
            )),
      ],
    ));
  }
}

class _SettingsWidget extends StatelessWidget {
  const _SettingsWidget();

  @override
  Widget build(BuildContext context) {
    return const _ProfileSettingsItemWidget(
      icon: Ionicons.settings_outline,
      itemName: "Settings",
      itemDesc: "Make changes to your settings",
      toNavigate: SettingNavigationView(),
    );
  }
}

class _PaymentMethodsWidget extends StatelessWidget {
  const _PaymentMethodsWidget();

  @override
  Widget build(BuildContext context) {
    return const _ProfileSettingsItemWidget(
      icon: Ionicons.card_outline,
      itemName: "Payment methods",
      itemDesc: "Manage your cards",
      toNavigate: PaymentMethodNavigationView(),
    );
  }
}

class _PrivacyPolicyWidget extends StatelessWidget {
  const _PrivacyPolicyWidget();

  @override
  Widget build(BuildContext context) {
    return const _ProfileSettingsItemWidget(
      icon: Ionicons.shield_checkmark_outline,
      itemName: "Privacy Policy",
      itemDesc: "Read our privacy policy",
      toNavigate: PrivacyPolicyNavigationView(),
    );
  }
}

class _FavRestaurantsWidget extends StatelessWidget {
  const _FavRestaurantsWidget();

  @override
  Widget build(BuildContext context) {
    return const _ProfileSettingsItemWidget(
      icon: Ionicons.heart_outline,
      itemName: "Favorite Restaurants",
      itemDesc: "View your favorite restaurants",
      toNavigate: PrivacyPolicyNavigationView(),
    );
  }
}

class _LogoutWidget extends StatelessWidget {
  const _LogoutWidget();

  @override
  Widget build(BuildContext context) {
    return _ProfileSettingsItemWidget(
      icon: Ionicons.log_out_outline,
      itemName: "Log out",
      itemDesc: "Tap here to log out of your account",
      onTap: () {
        showConfirmationDialog(
            context, "Log out", "Are you sure you want to log out ?", () {
          context.read<LoginCubit>().logout();
          context.router.replace(const LoginNavigationView());
        });
      },
    );
  }
}

class _HelpSupportWidget extends StatelessWidget {
  const _HelpSupportWidget();

  @override
  Widget build(BuildContext context) {
    return const _ProfileSettingsItemWidget(
      icon: Ionicons.information_circle_outline,
      itemName: "Home & Support",
      toNavigate: HelpNavigationView(),
    );
  }
}

class _AboutAppWidget extends StatelessWidget {
  const _AboutAppWidget();

  @override
  Widget build(BuildContext context) {
    return const _ProfileSettingsItemWidget(
      icon: Ionicons.heart_outline,
      itemName: "About App",
    );
  }
}

class _ProfileSettingsItemWidget extends StatelessWidget {
  final IoniconsData icon;
  final String itemName;
  final String? itemDesc;
  final PageRouteInfo<dynamic>? toNavigate;
  final Function()? onTap;

  const _ProfileSettingsItemWidget(
      {required this.icon,
      required this.itemName,
      this.itemDesc,
      this.toNavigate,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap ??
            () {
              context.router.push(toNavigate!);
            },
        child: Row(
          children: <Widget>[
            const PlaceholderWidget(
              width: 8,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: Colors.purple.shade300,
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  itemName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: itemDesc != null
                    ? Text(
                        itemDesc!,
                        style: const TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 12),
                      )
                    : null,
                trailing: const Icon(Icons.arrow_forward_ios, size: 15),
              ),
            ),
          ],
        ));
  }
}
