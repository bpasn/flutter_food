// ignore_for_file: prefer_final_fields, avoid_print, curly_braces_in_flow_control_structures

import 'package:flutter/cupertino.dart';
import 'package:flutter_layout/data/repository/popular_product_repo.dart';
import 'package:flutter_layout/models/products_models.dart';
import 'package:flutter_layout/until/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  get _popularProductRepo => popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  int _quantity = 0;
  int get quantity => _quantity;
  Future<Response> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("StatusCode:>>Products:>> ${response.statusCode}");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      await Future.delayed(Duration(seconds: 1), () {
        _isLoading = true;
      });
      update();
    } else {
      print("this error get product");
      print(response.body);
    }
    return response;
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      Get.snackbar("Item count", "You can't reduce more !");
      _quantity = checkQuantity(_quantity + 1);
    } else {
      checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar("Item count", "You can't reduce more !",backgroundColor: AppColors.mainColor);
      return 0;
    } else if (quantity > 20) {
       Get.snackbar("Item count", "You can't add more !",
          backgroundColor: AppColors.mainColor);
      return 20;
    } else
      return quantity;
  }
}
