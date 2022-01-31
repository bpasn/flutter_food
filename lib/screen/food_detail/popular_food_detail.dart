import 'package:flutter/material.dart';
import 'package:flutter_layout/screen/food/icon_and_text_body.dart';
import 'package:flutter_layout/until/dimention.dart';
import 'package:flutter_layout/widget/app_column.dart';
import 'package:flutter_layout/widget/text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.PopularFoodImaSize,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                // ignore: prefer_const_constructors
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("./assets/image/pic_1.jpeg")),
              ),
            ),
          ),
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                  ),
                ],
              )),
          Positioned(
            left: 0,
            right: 0,
            top: Dimensions.PopularFoodImaSize - 20,
            bottom: 0,
            child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius15),
                    topRight: Radius.circular(Dimensions.radius15),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: AppColumn(
                        text: 'Chinese Side',
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Container(child: BigText(text: "Introduce"))
                  ],
                )),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.buttonHeightBar,
        padding: EdgeInsets.only(
          top: Dimensions.height30,
          bottom: Dimensions.height30,
          left: Dimensions.width20,
          right: Dimensions.width20,
        ),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20 * 2),
            topRight: Radius.circular(Dimensions.radius20 * 2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  bottom: Dimensions.height15,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Icon(Icons.remove),
                    SizedBox(
                      width: Dimensions.width10 / 2,
                    ),
                    BigText(text: "0"),
                    SizedBox(
                      width: Dimensions.width10 / 2,
                    ),
                    Icon(Icons.add)
                  ],
                )),
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height15,
                bottom: Dimensions.height15,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(Dimensions.radius20)),
              child: BigText(text: "\$10|Add To Cart"),
            ),
          ],
        ),
      ),
    );
  }
}

class AppIcon extends StatelessWidget {
  IconData icon;
  Color? backgroundColor;
  Color? iconColor;
  double? size;

  AppIcon(
      {required this.icon,
      this.backgroundColor = const Color(0xFFfcf4e4),
      this.iconColor = const Color(0xFF756d54),
      this.size = 40});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size! / 2),
          color: backgroundColor,
        ),
        child: Icon(icon, size: Dimensions.iconSize16, color: iconColor));
  }
}
