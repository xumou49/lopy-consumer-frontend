import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../widgets/common/appbar_widget.dart';

@RoutePage()
class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GradientAppBar(),
      body: ListView(
        padding: const EdgeInsets.only(left: 25),
        children: <Widget>[
          // browse history
          SizedBox(
            height: 100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                const TextWidget(
                  text: "Your browser history",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 30,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildSearchItem('Soup'),
                      _buildSearchItem('Chips'),
                      _buildSearchItem('Nuts'),
                      _buildSearchItem('Vegetable'),
                      _buildSearchItem('Fruits'),
                      // Add more search items here
                    ],
                  ),
                ),
              ],
            ),
          ),
          // browse by category
          SizedBox(
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextWidget(
                  text: 'Browse by category',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 400,
                  child: GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    children: [
                      _buildCategoryItem('Vegetables',
                          'https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png'),
                      _buildCategoryItem('Bak Kwa',
                          'https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png'),
                      _buildCategoryItem('Soup',
                          'https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png'),
                      _buildCategoryItem('Finger Food',
                          'https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png'),
                      _buildCategoryItem('Confectionery',
                          'https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png'),
                      _buildCategoryItem('Snacks',
                          'https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png'),
                      _buildCategoryItem('Candy & Sweet',
                          'https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png'),
                      _buildCategoryItem('Nuts & Seeds',
                          'https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png'),
                      _buildCategoryItem('Fruits',
                          'https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png'),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSearchItem(String itemName) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: const Color(0x4CC4C4C4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextWidget(
        text: itemName,
        fontSize: 12,
      ),
    );
  }

  Widget _buildCategoryItem(String itemName, String imageUrl) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 5),
        Container(
          margin: const EdgeInsets.only(left: 15),
          child: TextWidget(
            text: itemName,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
