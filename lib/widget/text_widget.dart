// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_layout/until/dimention.dart';

class BigText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  TextOverflow textoverflow;

  BigText(
      {required this.text,
      this.size = 0,
      this.color = const Color(0xFF332d2b),
      this.textoverflow = TextOverflow.ellipsis});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // overflow: textoverflow,
      style: TextStyle(
        color: color,
        fontFamily: "Sukumvit",
        fontSize: size == 0 ? Dimensions.font20 : size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  double size;
  TextOverflow textoverflow;

  SmallText(
      {required this.text,
      this.size = 0,
      this.color = const Color(0xFF89dad0),
      this.textoverflow = TextOverflow.ellipsis});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // overflow: textoverflow,
      style: TextStyle(
        color: color,
        fontFamily: "Sukumvit",
        fontSize: size == 0 ? Dimensions.font12 : size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
