import 'package:flutter_layout/data/api/api_client.dart';
import 'package:flutter_layout/until/app_constants.dart';
import 'package:get/get.dart';

class ReccommendedProductRepo extends GetxService {
  final ApiClient apiClient;

  ReccommendedProductRepo({required this.apiClient});

  Future<Response> getRecommendedProductList() async {
    return apiClient.getData(AppConstants.RECOMMENDED_PRODUCE_URI);
  }
}
