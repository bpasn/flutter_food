// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_layout/header/header_food.dart';
import 'package:flutter_layout/until/dimention.dart';

import 'food/food_body.dart';

class MainFoodScreen extends StatefulWidget {
  const MainFoodScreen({Key? key}) : super(key: key);

  @override
  _MainFoodScreenState createState() => _MainFoodScreenState();
}

class _MainFoodScreenState extends State<MainFoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        HeadWidgetFood(),
        SizedBox(
          height: Dimensions.height20,
        ),
        Expanded(child: SingleChildScrollView(child: FoodBody())),
      ],
    ));
  }
}
