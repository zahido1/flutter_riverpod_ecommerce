import 'package:dio/dio.dart';
import 'package:flutter_riverpod_ecommerce/model/api_product_model.dart';

class ApiService {
  final String url = "https://dummyjson.com/products";
  Dio dio = Dio();

  Future<ApiProductModel?> getProducts() async {
    try {
      final response = await dio.get<String>(url);
      if (response.statusCode == 200) {
        var products = apiProductModelFromJson(response.data!);
        return products;
      }
    } catch (e) {
      throw Exception(e);
    }
    return null;
  }
}
