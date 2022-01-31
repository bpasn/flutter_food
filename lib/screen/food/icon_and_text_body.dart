// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_layout/until/dimention.dart';
import 'package:flutter_layout/widget/text_widget.dart';

class IconAndTextWidget extends StatelessWidget {
  String text;
  IconData icon;
  Color? iconColor;
  Color? textColor;

  IconAndTextWidget(
      {Key? key,
      required this.icon,
      this.iconColor,
      required this.text,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.iconSize24,
        ),
        SizedBox(
          width: Dimensions.width5,
        ),
        SmallText(
          text: text,
          color: textColor,
        )
      ],
    );
  }
}
