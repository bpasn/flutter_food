import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height; //ความสูงของDevice
  static double screenwidth = Get.context!.width; //ความกว้างของDevice
  static double pageView = screenHeight / 2.64;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;

  // ต้องการความสูงของ10 เลยเอา ความสูงของDevice มา/10 ได้ออกมาเป็น 84.4
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;

  //dynamic width margin padding
  static double width5 = screenHeight / 133.5;
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;
  static double width45 = screenHeight / 18.76;

//dynamic font
  static double font20 = screenHeight / 42.2;
  static double font12 = screenHeight / 70.3;

//dynamic radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

  static double iconSize24 = screenHeight / 35.17;
}
