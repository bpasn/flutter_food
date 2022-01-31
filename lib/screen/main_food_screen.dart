import 'package:flutter/material.dart';
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
        Container(
          margin: EdgeInsets.only(
              top: Dimensions.height45, bottom: Dimensions.height15),
          padding: EdgeInsets.only(
              top: Dimensions.height30,
              left: Dimensions.width15,
              right: Dimensions.width15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                      child: BigText(text: "BannerApp", color: Colors.blue)),
                  Container(
                    child: Row(
                      children: [
                        SmallText(text: "county"),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  width: Dimensions.width45,
                  height: Dimensions.height45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: Colors.blue),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: Dimensions.iconSize24,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        FoodBody()
      ],
    ));
  }
}

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
        fontSize: size == 0 ? Dimensions.font12 : size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
