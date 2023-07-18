import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ecommerce/constants/themes.dart';
import 'package:flutter_riverpod_ecommerce/model/new_product_model.dart';
import 'package:flutter_riverpod_ecommerce/provider/constant/all_providers.dart';

class ProductCart extends ConsumerWidget {
  final NewProductModel product;
  const ProductCart({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading:
          SizedBox(height: 100, width: 100, child: Image.asset(product.imgUrl)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: MyTextStyle.productTitleStyle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              product.shortDescription,
              style: MyTextStyle.producDescriptiontyle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${product.price}",
                style: MyTextStyle.productTitleStyle,
              ),
              Row(children: [
                GestureDetector(
                  onTap: () {
                    if (product.countInCart == 1) {
                      ref
                          .read(cartStateNotifier.notifier)
                          .deleteFromCart(product.productId);
                      ref
                          .read(productStateNotifier.notifier)
                          .toggleSelected(product.productId);
                    } else {
                      ref
                          .read(cartStateNotifier.notifier)
                          .decrement(product.productId);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: const Icon(Icons.remove),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  product.countInCart.toString(),
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    ref
                        .read(cartStateNotifier.notifier)
                        .increment(product.productId);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
