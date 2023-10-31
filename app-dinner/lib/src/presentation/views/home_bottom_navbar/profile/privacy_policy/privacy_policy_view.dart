import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';


@RoutePage()
class PrivacyPolicyView extends StatelessWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(243, 129, 129, 1),
        title: const Text("privacy policy"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          ListTile(
            title: const Text('privacy policy'),
            onTap: () {
              context.router.pop();
            },
          ),
        ],
      ),
    );
  }
}
