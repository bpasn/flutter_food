// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_layout/data/controller/PopularProductController.dart';
import 'package:flutter_layout/helper/dependencies.dart' as dep;
import 'package:flutter_layout/screen/food_detail/popular_food_detail.dart';
import 'package:flutter_layout/screen/main_food_screen.dart';
import 'package:flutter_layout/screen/recmomend_food_detail.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

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
  
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: MainFoodScreen()
        //RecommendedFoodDetail()
        // MainFoodScreen(),
        );
  }
}
