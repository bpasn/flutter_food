// ignore_for_file: prefer_final_fields, unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter_layout/data/repository/popular_product_repo.dart';
import 'package:flutter_layout/data/repository/recommended_products_repo.dart';
import 'package:flutter_layout/models/products_models.dart';
import 'package:get/get.dart';

class RecommendedProductsController extends GetxController {
  final ReccommendedProductRepo reccommendedProductRepo;

  get _reccommendedProductRepo => reccommendedProductRepo;

  RecommendedProductsController({required this.reccommendedProductRepo});

  List<dynamic> _reccommendedProductList = [];
  List<dynamic> get reccommendedProductList => _reccommendedProductList;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<Response> getreccommendedProductList() async {
    Response response =
        await reccommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      print("StatusCode:>>Recommended:>> ${response.statusCode}");
      _reccommendedProductList = [];
      _reccommendedProductList.addAll(Product.fromJson(response.body).products);
      await Future.delayed(Duration(seconds: 2), () {
        _isLoading = true;
      });
      update();
    } else {
      print("this error get product");
      print(response.body);
    }
    return response;
  }
}
