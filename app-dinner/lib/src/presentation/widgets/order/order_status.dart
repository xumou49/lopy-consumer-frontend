import 'package:flutter/material.dart';

class OrderStatusTransition extends StatelessWidget {
  final int status;
  static final Map<int, List<Widget>> _transitionMap = _initTransitionMap();

  const OrderStatusTransition({Key? key, required this.status})
      : super(key: key);

  static Map<int, List<Widget>> _initTransitionMap() {
    // prepare widget
    var waitingIcon =
        const OrderStatusIcon(isColorFill: false, color: Color(0xFFD1D5DB));
    var processingIcon = const OrderStatusIcon(
        isColorFill: false,
        color: Color(0xFFF38181),
        content: Icon(
          Icons.circle,
          color: Color(0xFFF38181),
          size: 10.0,
        ));
    var completedIcon = const OrderStatusIcon(
        isColorFill: true,
        color: Color(0xFFF38181),
        content: Icon(
          Icons.done,
          color: Colors.white,
          size: 16.0,
        ));
    var pinkBar = const OrderStatusBar(color: Color(0xFFF18484));
    var greyBar = const OrderStatusBar(color: Color(0xFFD1D5DB));
    // init the different transition to map
    return {
      0: [processingIcon, greyBar, waitingIcon, greyBar, waitingIcon],
      1: [completedIcon, pinkBar, processingIcon, greyBar, waitingIcon],
      2: [completedIcon, pinkBar, completedIcon, pinkBar, processingIcon]
    };
  }

  @override
  Widget build(BuildContext context) {
    var orderStatusProgressBars = _transitionMap[status];
    orderStatusProgressBars ??= [];
    return SizedBox(
        height: 50,
        width: double.infinity,
        child: Column(
          children: [
            // progress bar
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: orderStatusProgressBars),
            ),
            const SizedBox(height: 10),
            // text
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OrderStatusText("accepting"),
                  OrderStatusText("preparing"),
                  OrderStatusText("completed")
                ])
          ],
        ));
  }
}

class OrderStatusIcon extends StatelessWidget {
  final bool isColorFill;
  final Color color;
  final Widget? content;

  const OrderStatusIcon(
      {Key? key,
      this.isColorFill = false,
      this.color = Colors.black,
      this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // default with color fill
    var decoration = ShapeDecoration(shape: const OvalBorder(), color: color);
    if (!isColorFill) {
      decoration = ShapeDecoration(
          shape: OvalBorder(
        side: BorderSide(width: 2, color: color),
      ));
    }
    return Container(
        width: 26, height: 26, decoration: decoration, child: content);
  }
}

class OrderStatusBar extends StatelessWidget {
  final double height;
  final Color color;
  const OrderStatusBar({Key? key, this.height = 2, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    double barWidth = (screenWidth - 64 - 26 * 3) / 2;
    return Container(
      width: barWidth,
      height: height,
      decoration: BoxDecoration(color: color),
    );
  }
}

class OrderStatusText extends StatelessWidget {
  final String text;
  const OrderStatusText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w400,
          height: 0.16,
        ));
  }
}
