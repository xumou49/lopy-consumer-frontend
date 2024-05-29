import 'package:Lopy/src/domain/models/cuisine.dart';
import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:flutter/material.dart';

class RestaurantCuisineWidget extends StatelessWidget {
  final List<Cuisine> dataList;

  const RestaurantCuisineWidget({super.key, required this.dataList});

  List<Widget> _buildRestaurantCuisineItem() {
    List<Widget> widgetList = [];
    for (var element in dataList) {
      widgetList.add(RestaurantCuisineItem(
          name: element.name!, imageUrl: element.imagePath!));
    }
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const TextWidget(
          text: 'Browse by category',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        const SizedBox(height: 12),
        SizedBox(
            height: 600,
            child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                // childAspectRatio: 4 / 3,
                children: _buildRestaurantCuisineItem())),
      ]),
    );
  }
}

class RestaurantCuisineItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const RestaurantCuisineItem(
      {super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // context.router.push(RestaurantListView(cuisine: itemName));
        print("hihi");
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 8,
              child: Container(
                // width: double.infinity,
                // height: 80,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                height: 15,
                alignment: Alignment.center,
                child: TextWidget(
                  text: name,
                  fontSize: 10,
                ),
              ))
        ],
      ),
    );
  }
}
