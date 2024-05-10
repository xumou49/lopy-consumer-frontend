import 'package:Lopy/src/domain/models/history_search.dart';
import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:flutter/material.dart';

class BrowseHistoryWidget extends StatelessWidget {
  final List<HistorySearch> dataList;

  const BrowseHistoryWidget({super.key, required this.dataList});

  List<Widget> _buildBrowseHistoryItem() {
    List<Widget> widgetList = [];
    for (var element in dataList) {
      widgetList.add(BrowseHistoryItem(name: element.name!));
    }
    return widgetList;
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
            text: "Your browser history",
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 30,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _buildBrowseHistoryItem(),
              )),
        ],
      ),
    );
  }
}

class BrowseHistoryItem extends StatelessWidget {
  final String name;

  const BrowseHistoryItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
