import 'package:flutter/material.dart';
import 'package:newads/widgets/text.dart';

class MultiSwitcherWidget extends StatelessWidget {
  MultiSwitcherWidget(
      {this.fontColor,
      Key? key,
      required this.ontap,
      required this.text,
      this.color})
      : super(key: key);

  VoidCallback? ontap;
  String text;
  Color? color;
  Color? fontColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
            onTap: ontap,
            child: Container(
              color: color,
              padding: const EdgeInsets.all(8.0),
              child: defaultText(
                text,
                color: fontColor,
              ),
            )));
  }
}
