import 'package:Lopy/src/presentation/widgets/common/appbar_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

@RoutePage()
class HomeSupportView extends StatelessWidget {
  const HomeSupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          // backgroundColor: const Color.fromRGBO(243, 129, 129, 1),
          title: "privacy policy",
          showBackButton: true,
          onBackButtonPressed: () {
            context.router.pop();
          },
        ),
        body: FutureBuilder(
          future: Future.delayed(const Duration(seconds: 1)).then((value) {
            return rootBundle
                .loadString("lib/src/assets/static/home_support.md");
          }),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Markdown(
                      data: snapshot.data!,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
