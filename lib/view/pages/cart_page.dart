import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ecommerce/constants/themes.dart';
import 'package:flutter_riverpod_ecommerce/model/new_product_model.dart';
import 'package:flutter_riverpod_ecommerce/provider/constant/all_providers.dart';
import 'package:flutter_riverpod_ecommerce/view/widgets/product_cart.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<NewProductModel> cartProducts = ref.watch(cartStateNotifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < cartProducts.length; i++)
                Column(
                  children: [
                    ProductCart(product: cartProducts[i]),
                    const Divider(),
                  ],
                ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Total:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: bannerColor,
                          fontSize: 20),
                    ),
                    Text(
                      "\$ ${ref.read(cartStateNotifier.notifier).totalPrice()}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: bannerColor,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
