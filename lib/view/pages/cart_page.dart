import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ecommerce/model/new_product_model.dart';
import 'package:flutter_riverpod_ecommerce/provider/constant/all_providers.dart';
import 'package:flutter_riverpod_ecommerce/view/widgets/product_cart.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<NewProductModel> cartProducts = ref.watch(cartStateNotifier);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (NewProductModel product in cartProducts)
              ProductCart(product: product)
          ],
        ),
      ),
    );
  }
}
