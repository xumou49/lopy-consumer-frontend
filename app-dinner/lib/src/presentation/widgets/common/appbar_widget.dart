import 'package:Lopy/src/presentation/widgets/common/placeholder_widget.dart';
import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:Lopy/src/presentation/views/search/search_view.dart';

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
      onTap: () {showOverlay(context);},
      decoration: InputDecoration(
        hintText: 'Search restaurant....',
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


class SearchPopUp extends StatelessWidget {
  final VoidCallback onClose;
  const SearchPopUp({Key? key, required this.onClose}) : super(key: key);

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

//   overlayEntry = OverlayEntry(
//     builder: (context) => Positioned(
//       top: 0,
//       left: 0,
//       right: 0,
//       bottom: 0,
//       child: Abc(
//         onClose: () {
//           overlayEntry?.remove();
//         },
//       ),
//     ),
//   );
//
//   Overlay.of(context)?.insert(overlayEntry!);
// }
  overlayEntry = OverlayEntry(
      builder: (context) =>
          Positioned(
            top: 0, bottom: 0, left: 0, right: 0,
            child: SearchPopUp(
              onClose: () {
                overlayEntry?.remove();
              },
            ),
          )
  );
  Overlay.of(context)?.insert(overlayEntry!);
}

class AutocompleteSearchList extends StatefulWidget {
  const AutocompleteSearchList({super.key});

  @override
  _AutocompleteSearchListState createState() => _AutocompleteSearchListState();
}

class _AutocompleteSearchListState extends State<AutocompleteSearchList> {
  String _currentInput = '';
  static const List<String> _searchHistorylist = <String>[
    'vegan'
    'vegetable',
    'fruits'
    'pizza',
    'hotpot',
    'italian',
  ];
  final double itemHeight = 48;
  final int maxItems = 5;
  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        _currentInput = textEditingValue.text;
        if (_currentInput == '') {
          return const Iterable<String>.empty();
        }
        return _searchHistorylist.where((String option) {
          return option.toLowerCase().startsWith(_currentInput.toLowerCase());
        });
      },
      onSelected: (String selection) {
        debugPrint('You just selected $selection');
      },
      optionsViewBuilder: (
          BuildContext context,
          AutocompleteOnSelected<String> onSelected,
          Iterable<String> options,
          ) {
        final int itemCount = options.length <= maxItems ? options.length : maxItems;
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 360, // Adjust as needed
                height: itemHeight * itemCount,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String option = options.elementAt(index);
                    final int matchStartIndex = option.toLowerCase().indexOf(_currentInput.toLowerCase());
                    final TextSpan matchText = TextSpan(
                      text: option.substring(matchStartIndex, matchStartIndex + _currentInput.length),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    );
                    final TextSpan remainingText = TextSpan(
                      text: option.substring(matchStartIndex + _currentInput.length),
                      style: TextStyle(fontWeight: FontWeight.normal),
                    );

                    return GestureDetector(
                      onTap: () => onSelected(option),
                      child: ListTile(
                        title: RichText(
                          text: TextSpan(
                            children: [
                              matchStartIndex > 0
                                  ? TextSpan(text: option.substring(0, matchStartIndex), style: TextStyle(fontWeight: FontWeight.normal))
                                  : TextSpan(),
                              matchText,
                              remainingText,
                            ],
                            style: DefaultTextStyle.of(context).style,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              _suggestionSearch()
            ],)
          ),
        );
      },

      fieldViewBuilder: (BuildContext context, TextEditingController textEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
        return TextField(
          controller: textEditingController,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: 'Search restaurant....',
            prefixIcon: Icon(Icons.search, color: Colors.pink.shade100),
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
      },
    );
  }
}

Widget _suggestionSearch(){
  return Container(
    // color: Colors.blue,
    height: 100, // Adjust the height to accommodate the search items
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Popular Search',
          style: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        SizedBox(
          height: 30,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSearchItem('vegan'),
              _buildSearchItem('vegetable'),
              _buildSearchItem('fruits'),
              _buildSearchItem('pizza'),
              _buildSearchItem('Fruits'),
              // Add more search items here
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildSearchItem(String itemName) {
  return Container(
    margin: EdgeInsets.only(top: 4, left: 4, right: 4, bottom: 4),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: const Color(0x4CC4C4C4),
      borderRadius: BorderRadius.circular(20),
    ),
    child:
    Text(
      itemName,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 10,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        height: 1,
      ),
    ),
  );
}
