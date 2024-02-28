import 'package:Lopy/src/presentation/widgets/common/placeholder_widget.dart';
import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:Lopy/src/presentation/widgets/restaurant_detail/menu_item_dialog_widget.dart';
import 'package:flutter/material.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 360,
        child: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const MenuItemDialogWidget();
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
                              'https://img.delicious.com.au/j95dyjBJ/del/2022/10/australian-capital-territory-kingleys-chicken-176385-3.png',
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
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: TextWidget(
                                        text: 'MenuItem Name',
                                        textAlign: TextAlign.end,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14)
                                    ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: TextWidget(
                                        text: 'S\$10.00',
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
