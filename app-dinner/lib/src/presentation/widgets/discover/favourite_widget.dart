import 'package:flutter/material.dart';
import 'package:Lopy/src/config/routers/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
enum CuisineType {
  italian,
  chinese,
  mexican,
  indian,
  japanese,
  french,
  thai,
  greek,
}
class FavouriteGridWidget extends StatelessWidget {
  const FavouriteGridWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 4,
      childAspectRatio: 1.0,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      // No space between the items in a row.
      children: List.generate(8, (index) {
        return _PizzaItemWidget(_cuisineTypeToString(_getCuisineType(index))); // Generates 8 CuisineItem widgets.
      }),
    );
  }

  String _cuisineTypeToString(CuisineType cuisineType) {
    return cuisineType.toString().split('.').last.toLowerCase();
  }

  CuisineType _getCuisineType(int index) {
    switch (index) {
      case 0:
        return CuisineType.italian;
      case 1:
        return CuisineType.chinese;
      case 2:
        return CuisineType.mexican;
      case 3:
        return CuisineType.indian;
      case 4:
        return CuisineType.japanese;
      case 5:
        return CuisineType.french;
      case 6:
        return CuisineType.thai;
      case 7:
        return CuisineType.greek;
      default:
        throw Exception("Invalid index for cuisine type");
    }
  }

}

class _PizzaItemWidget extends StatelessWidget {
  final String cuisineType;
  const _PizzaItemWidget(this.cuisineType, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(RestaurantListView(cuisine: cuisineType));
      },
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // Sets the radius of the image
              child: Image.network(
                "https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Text(_capitalizeFirstLetter(cuisineType)), // Replace with your text.
        ],
      ),
    );
  }

  String _capitalizeFirstLetter(String input) {
    return input.isNotEmpty
        ? input[0].toUpperCase() + input.substring(1)
        : input;
  }

}

