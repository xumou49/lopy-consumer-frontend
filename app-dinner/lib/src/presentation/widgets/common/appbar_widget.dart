import 'package:Lopy/src/presentation/widgets/common/placeholder_widget.dart';
import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../config/routers/app_router.gr.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? subtitle;
  final Icon? actionIcon;
  final Function()? onTapAction;
  final bool showBackButton;
  final bool showCartIcon;
  final VoidCallback? onBackButtonPressed;
  final List<Widget>? actions;
  final Function()? onTap;

  const GradientAppBar({
    super.key,
    this.title,
    this.showBackButton = false,
    this.showCartIcon = false,
    this.onBackButtonPressed,
    this.onTap,
    this.actions,
    this.subtitle,
    this.actionIcon,
    this.onTapAction,
  }) : assert(!showBackButton || onBackButtonPressed != null,
            'onBackButtonPressed must be provided if showBackButton is true');

  @override
  Widget build(BuildContext context) {
    Widget appBarTitle = title != null && title!.isNotEmpty
        ? AppBarTitleWidget(
            title: title!,
            subtitle: subtitle,
            actionIcon: actionIcon,
          )
        : const AppBarSearchFieldWidget();
    //     ? Text(title!)
    //     : TextField(
    //     decoration: InputDecoration(
    //     hintText: 'Search restaurant...',
    //     prefixIcon: Icon(Icons.search, color: Colors.pink.shade100),
    //     // border: const OutlineInputBorder(),
    //     enabledBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(15),
    //       borderSide: BorderSide(color: Colors.pink.shade100),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(15),
    //       borderSide: BorderSide(color: Colors.pink.shade200),
    //     ),
    //     filled: true,
    //     fillColor: Colors.white,
    //     contentPadding: const EdgeInsets.all(8),
    //   ),
    // );
    // List<Widget> appBarActions = [
    //   // if (showBackButton)
    //   //   IconButton(
    //   //     icon: const Icon(Icons.arrow_back_ios),
    //   //     onPressed: onBackButtonPressed ??
    //   //             () {
    //   //           Navigator.maybePop(context);
    //   //         },
    //   //   ),
    //   if (showCartIcon)
    //     IconButton(
    //       icon: const Icon(Icons.shopping_cart),
    //       onPressed: () {
    //         context.router.push(const CartNavigationView());
    //       },
    //     ),
    // ];
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          tileMode: TileMode.clamp,
          colors: GradientAppBar.colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: AppBar(
        iconTheme: const IconThemeData(color: Color.fromRGBO(169, 92, 92, 1)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: appBarTitle,
        leading: showBackButton
            ? IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color.fromRGBO(169, 92, 92, 1),
                ),
                onPressed: onBackButtonPressed ??
                    () {
                      Navigator.maybePop(context);
                    },
              )
            : null,
        // actions: actions ?? [],
        // actions: appBarActions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  static final List<Color> colors = [
    const Color.fromRGBO(243, 129, 129, 1),
    Colors.white,
  ];
}

class AppBarTitleWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Icon? actionIcon;
  final Function()? onTapAction;

  const AppBarTitleWidget(
      {super.key,
      required this.title,
      this.subtitle,
      this.actionIcon,
      this.onTapAction});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextWidget(
              text: title,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              textColor: const Color.fromRGBO(169, 92, 92, 1),
            ),
            subtitle != null
                ? TextWidget(
                    text: subtitle!,
                    textColor: const Color.fromRGBO(169, 92, 92, 1),
                  )
                : const PlaceholderWidget()
          ],
        ),
        actionIcon != null
            ? IconButton(
                onPressed: onTapAction == null
                    ? () {context.router.push(const CartNavigationView());} : () {},
                icon: actionIcon!)
            : const PlaceholderWidget()
      ],
    );

    return TextWidget(
      text: title,
      fontSize: 20,
      textColor: const Color.fromRGBO(169, 92, 92, 1),
    );
  }
  void hello() {
    print("hello");
  }
}

class AppBarSearchFieldWidget extends StatelessWidget {
  const AppBarSearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        showOverlay(context);
      },
      decoration: InputDecoration(
        hintText: 'Search restaurant...',
        prefixIcon: Icon(Icons.search, color: Colors.pink.shade100),
        // border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.pink.shade100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.pink.shade200),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(8),
      ),
    );
  }
}


class Abc extends StatelessWidget {
  final VoidCallback onClose;

  const Abc({Key? key, required this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        showBackButton: true,
        onBackButtonPressed: onClose,
      ),
      body: Center(
        child: Text("Your overlay content goes here"),
      ),
    );
  }
}

void showOverlay(BuildContext context) {
  OverlayEntry? overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: Abc(
        onClose: () {
          overlayEntry?.remove();
        },
      ),
    ),
  );

  Overlay.of(context)?.insert(overlayEntry!);
}