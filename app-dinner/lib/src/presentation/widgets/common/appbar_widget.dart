import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showBackButton;
  final VoidCallback? onBackButtonPressed;
  final List<Widget>? actions;
  final Function()? onTap;

  const GradientAppBar({
    super.key,
    this.title,
    this.showBackButton = false,
    this.onBackButtonPressed,
    this.onTap,
    this.actions,
  }) : assert(!showBackButton || onBackButtonPressed != null,
            'onBackButtonPressed must be provided if showBackButton is true');

  @override
  Widget build(BuildContext context) {
    Widget appBarTitle = title != null && title!.isNotEmpty
        ? Text(title!)
        : TextField(
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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: GradientAppBar.colors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: appBarTitle,
        leading: showBackButton
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: onBackButtonPressed ??
                    () {
                      Navigator.maybePop(context);
                    },
              )
            : null,
        actions: actions ?? [],
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
