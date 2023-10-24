import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';


@RoutePage()
class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(243, 129, 129, 1),
        title: const Text("help"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          ListTile(
            title: const Text('help'),
            onTap: () {
              context.router.pop();
            },
          ),
        ],
      ),
    );
  }
}
