import 'package:Lopy/src/presentation/cubits/history/history_keyword_list_cubit.dart';
import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrowseHistoryWidget extends StatelessWidget {
  final Function(String) onKeywordClick;

  const BrowseHistoryWidget({super.key, required this.onKeywordClick});

  Widget _buildBrowseHistoryItem(List<String> dataList) {
    // build the item widget
    List<Widget> widgetList = [];
    for (var keyword in dataList) {
      widgetList.add(
          BrowseHistoryItem(name: keyword, onKeywordClick: onKeywordClick));
    }
    // build the widget
    return SizedBox(
        height: 30,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: widgetList,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          const TextWidget(
            text: "History Search",
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 10),
          BlocBuilder<HistoryKeywordListCubit, HistoryKeywordListState>(
            builder: (_, state) {
              switch (state.runtimeType) {
                case HistoryKeywordListLoading:
                  return Center(child: CircularProgressIndicator());
                case HistoryKeywordListSuccess:
                  return _buildBrowseHistoryItem(state.historyKeywords);
                case HistoryKeywordListFailed:
                  print("Failed to get the history keyword list");
                  return const CircularProgressIndicator();
                default:
                  return const CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }
}

class BrowseHistoryItem extends StatelessWidget {
  final Function(String) onKeywordClick;
  final String name;

  const BrowseHistoryItem(
      {super.key, required this.name, required this.onKeywordClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: const Color(0x4CC4C4C4),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextWidget(
          text: name,
          fontSize: 12,
        ),
      ),
      onTap: () {
        onKeywordClick(name);
        print("onKeywordClick");
      },
    );
  }
}
