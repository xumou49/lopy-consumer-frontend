import 'package:Lopy/src/presentation/widgets/common/placeholder_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:Lopy/src/presentation/widgets/profile/profile_avatar_widget.dart';
import '../../../widgets/common/appbar_widget.dart';
import '../../../widgets/profile/profile_settings_widget.dart';

@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: const Color.fromRGBO(243, 129, 129, 1),
        //   title: const Text("Profile"),
        // ),
        appBar: const GradientAppBar(title:"Profile",),
        body: Container(
          color: Colors.white,
          child: ListView(
            children: const <Widget>[
              PlaceholderWidget(height: 20,),
              AvatarWidget(),
              PlaceholderWidget(height: 20,),
              ProfileSettingsWidget(),
            ],
          ),
        ));
  }
}

/*
@RoutePage()
class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(243, 129, 129, 1),
        title: const Text("Profile"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          ListTile(
            title: const Text('Payment methods'),
            onTap: () {
              context.router.push(const PaymentMethodNavigationView());
            },
          ),
          ListTile(
            title: const Text('setting'),
            onTap: () {
              context.router.push(const SettingNavigationView());
            },
          ),
          ListTile(
            title: const Text('help'),
            onTap: () {
              context.router.push(const HelpNavigationView());
            },
          ),
          ListTile(
            title: const Text('privacy policy'),
            onTap: () {
              context.router.push(const PrivacyPolicyNavigationView());
            },
          ),
        ],
      ),
    );
  }
}
 */
