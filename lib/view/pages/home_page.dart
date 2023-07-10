import 'package:flutter/material.dart';
import 'package:flutter_riverpod_ecommerce/constants/themes.dart';
import 'package:flutter_riverpod_ecommerce/view/widgets/category_chip_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/banner_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [
              BannerWidget(),
              CategoryChipWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
