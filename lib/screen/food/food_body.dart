// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout/screen/food/icon_and_text_body.dart';
import 'package:flutter_layout/screen/main_food_screen.dart';
import 'package:flutter_layout/until/dimention.dart';
import 'package:flutter_layout/widget/text_widget.dart';

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
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemBuilder: (context, positon) => getWidgetFoodBody(positon),
            itemCount: 5,
          ),
        ),
        //dots
        DotsIndicator(
          dotsCount: 5,
          position: _curntPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
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
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, int index) => 
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20,bottom: Dimensions.height10),
              child: Row(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("./assets/image/pic_1.jpeg",
                        )
                        ),
                    ),
                  ),
                  Container(
                    width: 220,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // ignore: prefer_const_literals_to_create_immutables
                      boxShadow: [
                          BoxShadow(color: Colors.grey.shade400, blurRadius: 9.0,offset: Offset(0, 5)),
                          // BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                          BoxShadow(color: Colors.white, offset: Offset(5, 0)),
                      ],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius15),
                        bottomRight: Radius.circular(Dimensions.radius15)
                      )),
                  )
                ],
              ),
              ), ),
        )
      ],
    );
  }

  Widget getWidgetFoodBody(int index) {
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
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('./assets/image/pic_1.jpeg'),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "Chinese Side ",
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => const Icon(
                            Icons.star,
                            color: Colors.blue,
                            size: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(text: "4.5", color: Colors.grey),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(text: "1200", color: Colors.grey),
                      SizedBox(
                        width: 5,
                      ),
                      SmallText(text: "Comments", color: Colors.grey),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(
                          icon: Icons.circle,
                          iconColor: Colors.amberAccent,
                          text: 'Normal',
                        ),
                        IconAndTextWidget(
                          icon: Icons.location_on,
                          iconColor: Colors.blue[200],
                          text: '1.4km',
                        ),
                        IconAndTextWidget(
                          icon: Icons.access_time,
                          iconColor: Colors.orangeAccent,
                          text: '34mim',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
