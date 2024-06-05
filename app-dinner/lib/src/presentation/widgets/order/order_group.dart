import 'package:Lopy/src/presentation/widgets/common/empty_result_widget.dart';
import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:flutter/material.dart';

class OrderGroup extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const OrderGroup({super.key, required this.title, required this.children});

  List<Widget> _buildChildren() {
    List<Widget> widgets = [];
    widgets.add(
        TextWidget(text: title, fontSize: 20, fontWeight: FontWeight.w500));
    widgets.add(const Divider());
    if (children.isNotEmpty) {
      widgets.addAll(children);
    } else {
      widgets.add(EmptyResultWidget(
          title: "No Data",
          subtitle: "Make your first order for today !",
          icon: const Icon(Icons.restaurant_menu,
              size: 50, color: Color.fromARGB(255, 132, 132, 132))));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildChildren(),
    );
  }
}
