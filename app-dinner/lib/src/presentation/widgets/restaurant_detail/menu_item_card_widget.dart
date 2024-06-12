import 'package:Lopy/src/domain/models/menu_item.dart';
import 'package:Lopy/src/presentation/widgets/common/image_widget.dart';
import 'package:Lopy/src/presentation/widgets/common/placeholder_widget.dart';
import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:Lopy/src/presentation/widgets/restaurant_detail/menu_item_dialog_widget.dart';
import 'package:flutter/material.dart';

class MenuItemCard extends StatefulWidget {
  final MenuItem menuItem;
  final int restaurantId;

  const MenuItemCard({super.key, required this.menuItem, required this.restaurantId});

  @override
  _MenuItemCardState createState() => _MenuItemCardState();
}

class _MenuItemCardState extends State<MenuItemCard> {
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
                      menuItem: widget.menuItem,
                      restaurantId: widget.restaurantId,
                    );
                  });
            },
            child: Column(
              children: <Widget>[
                Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                  bottomLeft: Radius.zero,
                                  bottomRight: Radius.zero),
                              child: ImageWidget(
                                  imageUrl: widget.menuItem.imageUrl, height: 150.0)),
                          Align(
                            alignment: const Alignment(0.95, 0.5),
                            child: LikeButton(),
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
                                        text: widget.menuItem.itemName,
                                        textAlign: TextAlign.end,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14)),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: TextWidget(
                                        text: 'S\$${widget.menuItem.price}',
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

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  void toggleLikeStatus() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isLiked ? Icons.favorite : Icons.favorite_border,
        color: Colors.pink.shade300,
        size: 25,
      ),
      onPressed: toggleLikeStatus,
    );
  }
}
