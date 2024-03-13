import 'package:Lopy/src/config/routers/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../widgets/common/appbar_widget.dart';

@RoutePage()
class SearchView extends StatelessWidget {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GradientAppBar(),
      body: ListView(
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              Container(
                // color: Colors.blue,
                height: 100, // Adjust the height to accommodate the search items
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Your browser history',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
              Container(
                // color: Colors.blue,
                height: 400,
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Browse by category',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 20,
                        children: [
                          _buildCategoryItem('Vegetables', 'https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png'),
                          _buildCategoryItem('Bak Kwa', 'https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png'),
                          _buildCategoryItem('Soup', 'https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png'),
                          _buildCategoryItem('Finger Food', 'https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png'),
                          _buildCategoryItem('Confectionery', 'https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png'),
                          _buildCategoryItem('Snacks', 'https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png'),
                          _buildCategoryItem('Candy & Sweet', 'https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png'),
                          _buildCategoryItem('Nuts & Seeds', 'https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png'),
                          _buildCategoryItem('Fruits', 'https://storage.googleapis.com/sticker-prod/syc9Sa2sjYaI5rJYmS9O/cover-1.thumb256.png'),
                          // Add more category items here
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
      margin: EdgeInsets.only(top: 4, left: 4, right: 4, bottom: 4),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0x4CC4C4C4),
        borderRadius: BorderRadius.circular(20),
      ),
      child:
      Text(
        itemName,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          height: 1,
        ),
      ),
    );
  }
  Widget _buildCategoryItem(String itemName, String imageUrl) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
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
        Text(
          itemName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 11,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],

    );
  }
}

