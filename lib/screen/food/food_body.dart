// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors, prefer_is_empty

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout/data/controller/PopularProductController.dart';
import 'package:flutter_layout/models/products_models.dart';
import 'package:flutter_layout/until/app_constants.dart';
import 'package:flutter_layout/until/colors.dart';
import 'package:flutter_layout/widget/icon_and_text_body.dart';
import 'package:flutter_layout/screen/main_food_screen.dart';
import 'package:flutter_layout/until/dimention.dart';
import 'package:flutter_layout/widget/app_column.dart';
import 'package:flutter_layout/widget/text_widget.dart';
import 'package:get/get.dart';

class FoodBody extends StatefulWidget {
  @override
  State<FoodBody> createState() => _FoodBodyState();
}

class _FoodBodyState extends State<FoodBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var _curntPageValue = 0.0;
  double _scaleFator = 0.8;
  double _heigth = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _curntPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("MediaQuery>>>>>" + MediaQuery.of(context).size.height.toString());
    print("Dimensions>>>>>" + Dimensions.screenHeight.toString());
    return Column(
      children: [
        //section card
        GetBuilder<PopularProductController>(
          builder: (popularProducts) => Container(
            height: Dimensions.pageView,
            child: PageView.builder(
              controller: pageController,
              itemCount: popularProducts.popularProductList.length,
              itemBuilder: (context, positon) => getWidgetFoodBody(
                  positon, popularProducts.popularProductList[positon]),
            ),
          ),
        ),

        //dots
        GetBuilder<PopularProductController>(
          builder: (popularProducts) => DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _curntPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        ),

        SizedBox(
          height: Dimensions.height30,
        ),

        //Poppular Text
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(
                text: "Popular",
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: "Food pairing",
                  color: Colors.black26,
                ),
              )
            ],
          ),
        ),

        //List Food
        Container(
          height: 700,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            // shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, int index) => Container(
              margin: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  bottom: Dimensions.height10),
              child: Row(
                children: [
                  Container(
                    height: Dimensions.ListViewImgSize,
                    width: Dimensions.ListViewImgSize,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "./assets/image/pic_1.jpeg",
                          )),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: Dimensions.ListViewTextSize,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400,
                                blurRadius: 9.0,
                                offset: Offset(0, 5)),
                            // BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                            BoxShadow(
                                color: Colors.white, offset: Offset(5, 0)),
                          ],
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius15),
                              bottomRight:
                                  Radius.circular(Dimensions.radius15))),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: Dimensions.width10,
                          right: Dimensions.width10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: "Nutritions fruit meal in China"),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            SmallText(
                                text: "With chinese characteristric",
                                color: Colors.grey.shade400),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(
                                      icon: Icons.circle,
                                      text: "Normal",
                                      iconColor: Colors.amberAccent),
                                  IconAndTextWidget(
                                      icon: Icons.location_on,
                                      text: "1.7mk",
                                      iconColor: Colors.blueAccent),
                                  IconAndTextWidget(
                                    icon: Icons.access_time,
                                    text: "34min",
                                    iconColor: Colors.orangeAccent,
                                  ),
                                ])
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getWidgetFoodBody(int index, ProductModel product) {
    final String img = product.img!;
    Matrix4 matrix = new Matrix4.identity();
    if (index == _curntPageValue.floor()) {
      var currScal = 1 - (_curntPageValue - index) * (1 - _scaleFator);
      var currTran = _heigth * (1 - currScal) / 2;
      matrix = Matrix4.diagonal3Values(1, currScal, 1)
        ..setTranslationRaw(0, currTran, 0);
    } else if (index == _curntPageValue.floor() + 1) {
      var currScal =
          _scaleFator + (_curntPageValue - index + 1) * (1 - _scaleFator);
      var currTran = _heigth * (1 - currScal) / 2;

      matrix = Matrix4.diagonal3Values(1, currScal, 1);
      matrix = Matrix4.diagonal3Values(1, currScal, 1)
        ..setTranslationRaw(0, currTran, 0);
    } else if (index == _curntPageValue.floor() - 1) {
      var currScal = 1 - (_curntPageValue - index) * (1 - _scaleFator);
      var currTran = _heigth * (1 - currScal) / 2;

      matrix = Matrix4.diagonal3Values(1, currScal, 1);
      matrix = Matrix4.diagonal3Values(1, currScal, 1)
        ..setTranslationRaw(0, currTran, 0);
    } else {
      var currScal = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScal, 1)
        ..setTranslationRaw(0, _heigth * (1 - _scaleFator) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
          margin: EdgeInsets.only(
              left: Dimensions.height15, right: Dimensions.height15),
          height: Dimensions.pageViewContainer,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  AppConstants.BASE_URL + '/uploads/' + product.img!),
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height30),
            height: Dimensions.pageViewTextContainer,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 5.0,
                  offset: Offset(0, 5)),
              BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
              BoxShadow(color: Colors.white, offset: Offset(5, 0)),
            ], borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: Container(
                padding: EdgeInsets.only(
                    left: 10, right: 10, top: Dimensions.height15),
                child: AppColumn(
                  text: product.name!,
                  product: product,
                )),
          ),
        )
      ]),
    );
  }
}
