import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const CustomExpansionTile(
      {super.key,
      required this.child,
      this.duration = const Duration(milliseconds: 300)});

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool isExpanded = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration, // Set your desired duration
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    // expand and show elements when component is created
    if (isExpanded) {
      _controller.forward();
    }
  }

  Widget _getToggleSwitch() {
    return SizedBox(
      height: 20,
      child: isExpanded
          ? const Icon(
              Icons.expand_less,
              color: Colors.black54,
            )
          : const Icon(Icons.expand_more, color: Colors.black54),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      child: Column(
        children: [
          InkWell(
            child: _getToggleSwitch(),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
                if (isExpanded) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              });
            },
          ),
          SizeTransition(
            sizeFactor: _animation,
            axisAlignment: 1.0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
