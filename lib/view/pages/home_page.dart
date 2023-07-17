import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ecommerce/constants/themes.dart';
import 'package:flutter_riverpod_ecommerce/model/product_model.dart';
import 'package:flutter_riverpod_ecommerce/view/widgets/category_chip_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../provider/business/products_provider.dart';
import '../widgets/banner_widget.dart';
import '../widgets/product_title_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<ProductModel> products = ref.watch(productsProvider);
    final apiProducts = ref.watch(apiProductsProvider);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: SvgPicture.asset(
            "assets/images/logo.svg",
            width: 130,
          ),
          centerTitle: true,
          actions: [
            Container(
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.local_mall_outlined)))
          ],
        ),
        drawer: const Drawer(
          backgroundColor: appBarColor,
        ),
        body: apiProducts.when(
          data: (data) {
            var products = data!.products;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const BannerWidget(),
                    const CategoryChipWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    ProducTitleWidget(
                      function: () {},
                      title: "Hot Sales",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
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
                                    child: Image.network(
                                        products[index].images[0]),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 12,
                                      ),
                                      Text(
                                        products[index].title,
                                        style: MyTextStyle.productTitleStyle,
                                      ),
                                      Text(
                                        products[index].description,
                                        style:
                                            MyTextStyle.producDescriptiontyle,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "\$900",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
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
                    ),
                  ],
                ),
              ),
            );
          },
          error: (err, stack) => Text('Error: $err'),
          loading: () => const CircularProgressIndicator(),
        ));
  }
}
