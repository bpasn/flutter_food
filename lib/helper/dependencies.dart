import 'package:flutter_layout/data/api/api_client.dart';
import 'package:flutter_layout/data/controller/PopularProductController.dart';
import 'package:flutter_layout/data/repository/popular_product_repo.dart';
import 'package:flutter_layout/until/app_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<void> init()async {
  //api client
Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
// Get.lazyPut(() => ApiClient(appBaseUrl:"https://api-plant.redcross.or.th"));

//repos
Get.lazyPut(() => PopularProductRepo(apiClient:Get.find()));


//controllers

Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));



}

