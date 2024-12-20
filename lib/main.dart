// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_layout/data/controller/popular_product_controller.dart';
import 'package:flutter_layout/data/controller/recommended_products_controller.dart';
import 'package:flutter_layout/helper/dependencies.dart' as dep;
import 'package:flutter_layout/routes/route_helper.dart';
import 'package:flutter_layout/screen/food_detail/popular_food_detail.dart';
import 'package:flutter_layout/screen/main_food_screen.dart';
import 'package:flutter_layout/screen/food_detail/recmomend_food_detail.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductsController>().getreccommendedProductList();

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'Flutter Demo',
        home: MainFoodScreen(),
        initialRoute: RouteHelper.init,
        getPages: RouteHelper.routes,
        //RecommendedFoodDetail()
        // MainFoodScreen(),
        );
  }
}
