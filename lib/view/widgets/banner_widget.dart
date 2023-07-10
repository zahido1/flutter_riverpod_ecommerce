import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ecommerce/provider/constant/all_providers.dart';

import '../../constants/themes.dart';

class BannerWidget extends ConsumerWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bannerColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ref.read(bannerTitle),
                  style: MyTextStyle.bannerTitleStyle,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  ref.read(bannerDesc),
                  style: MyTextStyle.bannerDescStyle,
                ),
                TextButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.zero),
                  ),
                  child: Text(
                    "Shop new Year",
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                ),
              ],
            ),
          ),
          Image.asset("assets/images/banner.png"),
        ],
      ),
    );
  }
}
