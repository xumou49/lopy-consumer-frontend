
import 'package:Lopy/src/presentation/widgets/common/placeholder_widget.dart';
import 'package:Lopy/src/presentation/widgets/common/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewPaymentTextFieldWidget extends StatelessWidget {
  final String title;
  final String placeholder;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final FormFieldValidator? validator;
  final Function(String) onSaved;

  const NewPaymentTextFieldWidget(
      {Key? key,
      required this.title,
      required this.placeholder,
      this.controller,
      this.keyboardType,
      this.inputFormatters,
      this.suffixIcon,
      this.validator,
      required this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle =
        const TextStyle(fontFamily: 'Montserrat', fontSize: 14.0);

    OutlineInputBorder boarderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.transparent),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextWidget(
          text: title,
          textColor: Colors.black54,
        ),
        const PlaceholderWidget(height: 10),
        SizedBox(
          height: 90.0,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.text,
            inputFormatters: inputFormatters,
            style: textStyle,
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: textStyle,
              suffixIcon: suffixIcon,
              enabledBorder: boarderStyle,
              focusedBorder: boarderStyle,
              filled: true,
              fillColor: const Color.fromRGBO(240, 245, 250, 1),
            ),
            validator: validator,
            onSaved: (value) {
              onSaved(value ?? "");
            },
          ),
        )
      ],
    );
  }
}
