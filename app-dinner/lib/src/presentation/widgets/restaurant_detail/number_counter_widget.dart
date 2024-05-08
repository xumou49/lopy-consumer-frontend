import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CounterStep extends StatefulWidget {
  const CounterStep({
    required this.min,
    required this.max,
    this.initial,
    this.step = 1,
    required this.valueChanged,
    Key? key,
  })  : assert(min < max),
        assert(initial == null || (initial >= min && initial <= max)),
        assert(step > 0),
        super(key: key);

  /// 最小值
  final int min;

  /// 最大值
  final int max;

  /// 初始值，如果初始值为null或无效，则初始值为[min]最小值
  final int? initial;

  /// 步进，每次+/- Value变化数值，必须是正数
  final int step;

  /// Value值改变回调
  final ValueChanged<int> valueChanged;

  @override
  State<CounterStep> createState() => _CounterStepState();
}

class _CounterStepState extends State<CounterStep> {
  late final controller =
      TextEditingController(text: (widget.initial ?? widget.min).toString());

  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Theme.of(context).colorScheme.outline, width: 0.5),
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildReduceButton(),
          VerticalDivider(
              width: 1, color: Theme.of(context).colorScheme.outline),
          SizedBox(
            width: 50,
            child: buildTextFieldInput(),
          ),
          VerticalDivider(
              width: 1, color: Theme.of(context).colorScheme.outline),
          buildIncreaseButton(),
        ],
      ),
    );
  }

  Widget buildTextFieldInput() {
    return TextField(
      decoration: const InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: InputBorder.none,
        fillColor: Colors.black,
      ),
      controller: controller,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      maxLines: 1,
      inputFormatters: [
        CounterTextInputFormatter(min: widget.min, max: widget.max),
      ],
      onChanged: (value) {
      },
    );
  }

  Widget buildReduceButton() {
    return InkWell(
      child: Container(
        color: const Color.fromRGBO(243, 129, 129, 1),
        child: const Icon(
          Icons.remove,
          color: Colors.white,
        ),
      ),
      onTap: () {
        setState(() {
          count = max(count - widget.step, widget.min);
          String text = count.toString();
          controller.value = TextEditingValue(
            text: text,
            selection: TextSelection.collapsed(offset: text.length),
          );
          widget.valueChanged(count); // Call the callback here
        });
      },
    );
  }

  Widget buildIncreaseButton() {
    return InkWell(
      child: Container(
        color: const Color.fromRGBO(243, 129, 129, 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      onTap: () {
        setState(() {
          count = min(count + widget.step, widget.max);
          String text = count.toString();
          controller.value = TextEditingValue(
            text: text,
            selection: TextSelection.collapsed(offset: text.length),
          );
          widget.valueChanged(count); // Call the callback here
        });
      },
    );
  }
}

class CounterTextInputFormatter extends TextInputFormatter {
  final int min;
  final int max;

  CounterTextInputFormatter({required this.min, required this.max});

  int get maxLength => '$max'.length;
  late final regExp = RegExp("^\\d{0,$maxLength}?\$");

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String oldText = oldValue.text;
    String newText = newValue.text;

    if (newText.isEmpty) {
      String text = '$min';
      return TextEditingValue(
        text: text,
        selection: TextSelection(baseOffset: 0, extentOffset: text.length),
      );
    }
    // 判定 新输入值符合输入预期
    bool isValid =
        (oldText.length > newText.length) || regExp.hasMatch(newText);

    if (isValid) {
      // 如果以0开头、转换为有效数字
      if (newText.startsWith('0')) {
        String text = int.parse(newText).toString();
        return TextEditingValue(
          text: text,
          selection: TextSelection.collapsed(offset: text.length),
        );
      }
      return newValue;
    }

    return oldValue;
  }
}
