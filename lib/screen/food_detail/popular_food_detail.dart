import 'package:flutter/material.dart';
import 'package:flutter_layout/widget/app_icon.dart';
import 'package:flutter_layout/widget/icon_and_text_body.dart';
import 'package:flutter_layout/until/dimention.dart';
import 'package:flutter_layout/widget/app_column.dart';
import 'package:flutter_layout/widget/exandable_text.dart';
import 'package:flutter_layout/widget/text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      Container(child: BigText(text: "Introduce")),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: ExpandbleText(
                              text:
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                        ),
                      ),
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
      ),
    );
  }
}
