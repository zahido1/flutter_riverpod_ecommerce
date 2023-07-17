import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ecommerce/model/product_model.dart';
import 'package:flutter_riverpod_ecommerce/service/api_service.dart';

import '../../model/api_product_model.dart';

final productsProvider = FutureProvider<ProductModel>((ref) async {
  final content = json.decode(
    await rootBundle.loadString('assets/data/product_data.json'),
  ) as Map<String, dynamic>;

  return ProductModel.fromJson(content);
});

final apiProvider = Provider<ApiService>((ref) => ApiService());

final apiProductsProvider = FutureProvider<ApiProductModel?>(
  (ref) async {
    return ref.read(apiProvider).getProducts();
  },
);
