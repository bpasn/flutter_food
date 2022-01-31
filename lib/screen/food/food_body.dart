import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout/screen/main_food_screen.dart';
import 'package:flutter_layout/until/dimention.dart';

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
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemBuilder: (context, positon) => getWidgetFoodBody(positon),
            itemCount: 5,
          ),
        ),
        DotsIndicator(
          dotsCount: 5,
          position: _curntPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
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
              image: AssetImage('./assets/pic_food/pic_1.jpeg'),
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
                          text: 'Normal',
                        ),
                        //  SizedBox(
                        //   width: 15,
                        // ),
                        // Container(
                        //   child: Row(
                        //     children: [
                        //       Icon(Icons.location_on, color: Colors.blue[200]),
                        //       SmallText(
                        //         text: "1.4km",
                        //         color: Colors.grey,
                        //       )
                        //     ],
                        //   ),
                        // ),
                        // SizedBox(
                        //   width: 15,
                        // ),
                        // Container(
                        //   child: Row(
                        //     children: [
                        //       Icon(Icons.access_time, color: Colors.orange),
                        //       SmallText(
                        //         text: "34min",
                        //         color: Colors.grey,
                        //       )
                        //     ],
                        //   ),
                        // ),
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
