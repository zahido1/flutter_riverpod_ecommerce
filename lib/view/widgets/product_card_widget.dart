import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ecommerce/provider/constant/all_providers.dart';

import '../../constants/themes.dart';

class ProductCardWidget extends ConsumerWidget {
  final int catId;
  const ProductCardWidget({
    super.key,
    required this.catId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartProducts = ref.watch(cartStateNotifier.notifier);
    final allProducts = ref.watch(productStateNotifier.notifier);
    final products = ref
        .watch(productStateNotifier)
        .where((element) => element.categoryId == catId)
        .toList();
    return Container(
      height: 250,
      // color: Colors.amber,
      padding: const EdgeInsets.all(5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(2, 2),
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                  )
                ]),
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    color: productBgColor,
                    width: double.infinity,
                    padding: const EdgeInsets.all(6),
                    child: Image.asset(products[index].imgUrl),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        products[index].title,
                        style: MyTextStyle.productTitleStyle,
                      ),
                      Text(
                        products[index].shortDescription,
                        style: MyTextStyle.producDescriptiontyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$ ${products[index].price}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          products[index].isSelected
                              ? IconButton(
                                  onPressed: () {
                                    allProducts.toggleSelected(
                                      products[index].productId,
                                    );
                                    cartProducts.deleteFromCart(
                                      products[index].productId,
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    size: 28,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    allProducts.toggleSelected(
                                        products[index].productId);
                                    cartProducts.addToCart(
                                      products[index],
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.add_circle,
                                    size: 28,
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
