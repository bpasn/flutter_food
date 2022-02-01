// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String APP_NAME = 'DBFood';
  static const int APP_VERSION = 1;

  static const String BASE_URL = 'http://192.168.1.36:8000';
  static const String POPULAR_PRODUCE_URI = '/api/v1/products/popular';
  static const String RECOMMENDED_PRODUCE_URI = '/api/v1/products/recommended';

  static const String UPLOAD_URL = BASE_URL + '/uploads/';

  static const String TOKEN = 'DBtoken';
}
