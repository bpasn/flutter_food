import 'package:flutter/material.dart';
import 'package:flutter_layout/until/dimention.dart';
import 'package:flutter_layout/widget/text_widget.dart';

class HeadWidgetFood extends StatelessWidget {
  const HeadWidgetFood({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Container(child: BigText(text: "BannerApp", color: Colors.blue)),
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
    );
  }
}
