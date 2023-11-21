import 'package:flutter/material.dart';

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
        return const _PizzaItemWidget(); // Generates 8 CuisineItem widgets.
      }),
    );
  }
}

class _PizzaItemWidget extends StatelessWidget {

  const _PizzaItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const Text('Cuisine'), // Replace with your text.
      ],
    );
  }
}

