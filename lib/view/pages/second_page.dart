import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ecommerce/constants/themes.dart';
import 'package:flutter_riverpod_ecommerce/view/pages/cart_page.dart';
import 'package:flutter_riverpod_ecommerce/view/widgets/category_chip_widget.dart';
import 'package:flutter_riverpod_ecommerce/view/widgets/product_card_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/banner_widget.dart';
import '../widgets/product_title_widget.dart';

class SecondPage extends ConsumerWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const CartPage();
                    }));
                  },
                  icon: const Icon(Icons.local_mall_outlined)))
        ],
      ),
      drawer: const Drawer(
        backgroundColor: appBarColor,
      ),
      body: SingleChildScrollView(
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
              const ProductCardWidget(
                catId: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              ProducTitleWidget(
                function: () {},
                title: "Hot Sales",
              ),
              MasonryGridView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                ),
                itemBuilder: (context, index) {
                  return const ProductCardWidget(
                    catId: 2,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
