import 'package:Lopy/src/presentation/widgets/common/placeholder_widget.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/menu_item.dart';
import '../common/button_widget.dart';
import '../common/text_widget.dart';
import 'number_counter_widget.dart';

class MenuItemDialogWidget extends StatelessWidget {
  final MenuItem menuItem;

  const MenuItemDialogWidget({Key? key, required this.menuItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: SizedBox(
        height: 420,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: <Widget>[
                Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      // borderRadius: BorderRadius.circular(8.0),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                          bottomLeft: Radius.zero,
                          bottomRight: Radius.zero),
                      child: Image.network(
                        menuItem.imageUrl,
                        fit: BoxFit.cover,
                        height: 180,
                        width: double.infinity,
                      ),
                    )),
                Align(
                    alignment: const Alignment(0.95, 0.5),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 25,
                      ),
                    )),
              ],
            ),
            Padding(
              // padding: EdgeInsets.all(20.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: TextWidget(
                        text: menuItem.itemName,
                        fontSize: 14,
                      )),
                      Expanded(
                          child: TextWidget(
                              text: 'S\$${menuItem.price}',
                              textAlign: TextAlign.end,
                              fontSize: 14,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const Divider(thickness: 0.3),
                  const Row(
                    children: <Widget>[
                      Expanded(
                          child: TextWidget(
                              text: 'MenuItem Detail Description',
                              fontSize: 14)),
                    ],
                  ),
                  const PlaceholderWidget(height: 5.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: TextWidget(
                              text: menuItem.description, fontSize: 14)),
                    ],
                  ),
                  const PlaceholderWidget(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      CounterStep(min: 1, max: 10, valueChanged: (int value) {})
                    ],
                  ),
                  const PlaceholderWidget(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      ButtonWidget(
                          text: 'Add to Cart',
                          height: 40.0,
                          onPressed: () {
                            print('Hello');
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
