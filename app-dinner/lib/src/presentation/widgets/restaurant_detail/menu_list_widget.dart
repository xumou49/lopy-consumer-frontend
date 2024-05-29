import 'package:Lopy/src/domain/models/menu_category.dart';
import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:flutter/material.dart';

import '../common/empty_result_widget.dart';
import 'menu_item_card_widget.dart';

class MenuListWidget extends StatefulWidget {
  final MenuCategory menuCategory;
  final int restaurantId;

  const MenuListWidget(
      {Key? key, required this.menuCategory, required this.restaurantId})
      : super(key: key);

  @override
  State<MenuListWidget> createState() => _MenuListState();
}

class _MenuListState extends State<MenuListWidget> {
  @override
  void initState() {
    super.initState();
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    int restaurantId = widget.restaurantId;

    return Builder(builder: (context) {
      if (widget.menuCategory.menuList == null || widget.menuCategory.menuList.isEmpty) {
        return const Center(
            child: EmptyResultWidget(
                title: "No Results",
                subtitle:
                    "We cannot find any menu item with given restaurant.\n Try different restaurant."));
      } else {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: SizedBox(
                        child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.menuCategory.menuList.length,
                        // The number of restaurant cards
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    print("selected Index $selectedIndex");
                                  });
                                },
                                child: Container(
                                  height: 45,
                                  decoration: ShapeDecoration(
                                    color: (selectedIndex == index)
                                        ? const Color.fromRGBO(243, 129, 129, 1)
                                        : const Color.fromRGBO(
                                            252, 247, 255, 1),
                                    shape: ContinuousRectangleBorder(
                                      side: const BorderSide(
                                          width: 0, style: BorderStyle.none),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Opacity(
                                        opacity: 1,
                                        child: TextWidget(
                                            text: widget.menuCategory
                                                .menuList[index].menuName,
                                            textColor: (selectedIndex == index)
                                                ? Colors.black
                                                : Colors.black54,
                                            textOverflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ),
                              ),
                              const Divider(
                                height: 0.1,
                                thickness: 0.3,
                              ),
                            ],
                          );
                        },
                      ),
                    ))),
                Expanded(
                    flex: 5,
                    child: SizedBox(
                        child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Opacity(
                              opacity: 1,
                              child: TextWidget(
                                text: widget.menuCategory
                                    .menuList[selectedIndex].menuName,
                                fontSize: 20,
                              )),
                        ),
                        MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: widget.menuCategory
                                .menuList[selectedIndex].menuItemList.length,
                            // The number of restaurant cards
                            itemBuilder: (BuildContext context, int index) {
                              return MenuItemCard(
                                menuItem: widget
                                    .menuCategory
                                    .menuList[selectedIndex]
                                    .menuItemList[index],
                                restaurantId: restaurantId,
                              );
                            },
                          ),
                        )
                      ],
                    )))
              ],
            )
          ],
        );
      }
    });
  }
}
