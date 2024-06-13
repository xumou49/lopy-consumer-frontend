import 'package:Lopy/src/domain/models/cuisine.dart';
import 'package:Lopy/src/domain/models/restaurant.dart';
import 'package:Lopy/src/presentation/cubits/history/history_keyword_list_cubit.dart';
import 'package:Lopy/src/presentation/cubits/restaurant_info/restaurant_search_cubit.dart';
import 'package:Lopy/src/presentation/widgets/common/empty_result_widget.dart';
import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:Lopy/src/presentation/widgets/discover/restaurants_widget.dart';
import 'package:Lopy/src/presentation/widgets/search_view/browse_history.dart';
import 'package:Lopy/src/presentation/widgets/search_view/restaurant_cuisine.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/common/appbar_widget.dart';

@RoutePage()
class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController _controller = TextEditingController();

  void updateSearchBar(String keyword) {
    setState(() {
      _controller.text = keyword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          customTextEditingController: _controller,
          onSubmitted: (keyword) async {
            // explicitly force the api should be called first
            await context
                .read<RestaurantSearchCubit>()
                .getRestaurantsByKeyword(keyword);
            context.read<HistoryKeywordListCubit>().getHistoryKeywordList();
          },
          onChanged: (keyword) {
            context.read<RestaurantSearchCubit>().getHistoryByKeyword(keyword);
          },
        ),
        body: BlocBuilder<RestaurantSearchCubit, RestaurantSearchState>(
            builder: (_, state) {
          switch (state.runtimeType) {
            case RestaurantResultDefaultState:
              return RestaurantCategoryWidget(onKeywordClick: updateSearchBar);
            case RestaurantResultEmptyState:
              return const RestaurantEmptyWidget();
            case RestaurantResultAvailableState:
              return RestaurantDataWidget(
                  dataList: state.restaurants, onKeywordClick: updateSearchBar);
            default:
              return RestaurantCategoryWidget(onKeywordClick: updateSearchBar);
          }
        }));
  }
}

class RestaurantEmptyWidget extends StatelessWidget {
  const RestaurantEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      alignment: Alignment.center,
      child: EmptyResultWidget(
        title: "No Result",
        subtitle:
            "We cannot find the restaurant you are searching for.\n Try differnt keyword.",
      ),
    );
  }
}

class RestaurantDataWidget extends StatelessWidget {
  final List<Restaurant> dataList;
  final Function(String) onKeywordClick;

  const RestaurantDataWidget(
      {super.key, required this.dataList, required this.onKeywordClick});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BrowseHistoryWidget(onKeywordClick: onKeywordClick),
            const SizedBox(height: 15),
            const TextWidget(
              text: "Search Results",
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            RestaurantsWidget(dataList, scrollEnabled: true)
          ],
        ));
  }
}

class RestaurantCategoryWidget extends StatelessWidget {
  final Function(String) onKeywordClick;

  const RestaurantCategoryWidget({super.key, required this.onKeywordClick});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Column(
          children: [
            BrowseHistoryWidget(onKeywordClick: onKeywordClick),
            const SizedBox(height: 15),
            RestaurantCuisineWidget(dataList: _getCuisineDataList())
          ],
        ));
  }
}

// mock cuisine data for now
List<Cuisine> _getCuisineDataList() {
  return [
    const Cuisine(
        id: 1,
        name: 'Chicken Rice',
        imagePath:
            'https://api-lopy.wanioco.com/static/cuisine/chicken_rice.jpeg'),
    const Cuisine(
        id: 2,
        name: 'Thai',
        imagePath: 'https://api-lopy.wanioco.com/static/cuisine/thai.png'),
    const Cuisine(
        id: 3,
        name: 'Sushi',
        imagePath: 'https://api-lopy.wanioco.com/static/cuisine/sushi.png'),
    const Cuisine(
        id: 4,
        name: 'Ramen',
        imagePath: 'https://api-lopy.wanioco.com/static/cuisine/ramen.jpeg'),
    const Cuisine(
        id: 5,
        name: 'Dim Sum',
        imagePath: 'https://api-lopy.wanioco.com/static/cuisine/dim_sum.jpeg'),
    const Cuisine(
        id: 6,
        name: 'Korean',
        imagePath: 'https://api-lopy.wanioco.com/static/cuisine/korean.jpeg'),
    const Cuisine(
        id: 7,
        name: 'BBQ',
        imagePath: 'https://api-lopy.wanioco.com/static/cuisine/bbq.png'),
    const Cuisine(
        id: 8,
        name: 'Bubble Tea',
        imagePath:
            'https://api-lopy.wanioco.com/static/cuisine/bubble_tea.jpeg'),
    const Cuisine(
        id: 9,
        name: 'Fast Food',
        imagePath:
            'https://api-lopy.wanioco.com/static/cuisine/fast_food.jpeg'),
  ];
}
