// ignore_for_file: unnecessary_string_interpolations, avoid_print, prefer_const_constructors

import 'package:flutter_layout/screen/food_detail/popular_food_detail.dart';
import 'package:flutter_layout/screen/main_food_screen.dart';
import 'package:flutter_layout/screen/food_detail/recmomend_food_detail.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String init = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";



  static String getInitial() => "$init";

  static String getPopularFood(int pageId) => "$popularFood?pageId=$pageId";

  static String getRecommendedFood(int pageId) => "$recommendedFood?pageId=$pageId";



  static List<GetPage> routes = [
    GetPage(name: init, page: () => MainFoodScreen(),transition: Transition.fadeIn),
    GetPage(name: popularFood,page: (){
      var pageId = Get.parameters['pageId'];
      return PopularFoodDetail(pageId:int.parse(pageId!));
    } ,transition: Transition.fadeIn),
    GetPage(name: recommendedFood,page: () {
      var pageId = Get.parameters['pageId'];
      return RecommendedFoodDetail(pageId: int.parse(pageId!));
    },  transition: Transition.fadeIn),
    
  ];
}
