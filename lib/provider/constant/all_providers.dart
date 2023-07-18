import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ecommerce/model/new_product_model.dart';
import 'package:flutter_riverpod_ecommerce/provider/business/product_notifier.dart';

final bannerTitle = Provider<String>((ref) {
  return "Apple Store";
});

final bannerDesc = Provider<String>((ref) {
  return "Find the Apple product andaccessories you’re looking for";
});

final productStateNotifier =
    StateNotifierProvider<ProductNotifierManager, List<NewProductModel>>((ref) {
  return ProductNotifierManager();
});

final cartStateNotifier =
    StateNotifierProvider<CartNotifierManager, List<NewProductModel>>(
        (ref) => CartNotifierManager());
