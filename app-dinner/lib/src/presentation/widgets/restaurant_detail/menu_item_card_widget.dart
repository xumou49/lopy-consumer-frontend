import 'package:Lopy/src/domain/models/menu_item.dart';
import 'package:Lopy/src/presentation/widgets/common/placeholder_widget.dart';
import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:Lopy/src/presentation/widgets/restaurant_detail/menu_item_dialog_widget.dart';
import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;
  final int restaurantId;

  const MenuItemCard(
      {Key? key, required this.menuItem, required this.restaurantId}
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 360,
        child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return MenuItemDialogWidget(
                      menuItem: menuItem,
                      restaurantId: restaurantId,);
                  });
            },
            child: Column(
              children: <Widget>[
                Card(
                  color: Colors.white,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          ClipRRect(
                            // borderRadius: BorderRadius.circular(8.0),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                                bottomLeft: Radius.zero,
                                bottomRight: Radius.zero),
                            child: Image.network(
                              menuItem.imageUrl,
                              fit: BoxFit.cover,
                              height: 150,
                              width: double.infinity,
                            ),
                          ),
                          const Align(
                            alignment: Alignment(0.95, 0.5),
                            child: Icon(
                              Icons.favorite_outlined,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: TextWidget(
                                        text: menuItem.itemName,
                                        textAlign: TextAlign.end,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14)),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: TextWidget(
                                        text: 'S\$${menuItem.price}',
                                        textAlign: TextAlign.end)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const PlaceholderWidget(height: 5)
              ],
            )));
  }
}
