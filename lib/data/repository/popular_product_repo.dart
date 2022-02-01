import 'package:flutter_layout/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo({required this.apiClient});

  Future<Response> getDataProductList() async {
    return apiClient.getData('');
  }
}
