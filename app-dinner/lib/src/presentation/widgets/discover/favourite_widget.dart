import 'package:Lopy/src/config/routers/app_router.gr.dart';
import 'package:Lopy/src/domain/models/cuisine.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

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

  List<Widget> _buildCuisineItems() {
    final List<Cuisine> cuisineList = _getCuisineDataList();
    return cuisineList
        .map((cuisine) => _CuisineItemWidget(
              cuisineType: cuisine.name!,
              imageUrl: cuisine.imagePath!,
            ))
        .toList();
  }

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
        children: _buildCuisineItems());
  }
}

class _CuisineItemWidget extends StatelessWidget {
  final String cuisineType;
  final String imageUrl;
  const _CuisineItemWidget(
      {Key? key, required this.cuisineType, required this.imageUrl})
      : super(key: key);

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
              borderRadius:
                  BorderRadius.circular(10), // Sets the radius of the image
              child: Image.network(
                imageUrl,
                // "https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png",
                // "https://api-lopy.wanioco.com/static/cuisine/Pizza.png",
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

// mock cuisine data for now
List<Cuisine> _getCuisineDataList() {
  return [
    const Cuisine(
        id: 1,
        name: 'Western',
        imagePath: 'https://api-lopy.wanioco.com/static/cuisine/Western.png'),
    const Cuisine(
        id: 2,
        name: 'Chinese',
        imagePath: 'https://api-lopy.wanioco.com/static/cuisine/Chinese.png'),
    const Cuisine(
        id: 3,
        name: 'Japanese',
        imagePath: 'https://api-lopy.wanioco.com/static/cuisine/Japanese.png'),
    const Cuisine(
        id: 4,
        name: 'Korean',
        imagePath: 'https://api-lopy.wanioco.com/static/cuisine/Korean.png'),
    const Cuisine(
        id: 5,
        name: 'Malay',
        imagePath: 'https://api-lopy.wanioco.com/static/cuisine/Malay.png'),
    const Cuisine(
        id: 6,
        name: 'Hotpot',
        imagePath: 'https://api-lopy.wanioco.com/static/cuisine/Hotpot.png'),
    const Cuisine(
        id: 7,
        name: 'Pizza',
        imagePath: 'https://api-lopy.wanioco.com/static/cuisine/Pizza.png'),
    const Cuisine(
        id: 8,
        name: 'Noddle',
        imagePath: 'https://api-lopy.wanioco.com/static/cuisine/Noddle.png'),
  ];
}
