// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter_layout/data/repository/popular_product_repo.dart';
import 'package:flutter_layout/models/products_models.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  get _popularProductRepo => popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

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
}
