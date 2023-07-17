import 'package:flutter/material.dart';

import '../../constants/themes.dart';

class ProducTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback function; // final Function Function() function;
  const ProducTitleWidget({
    super.key,
    required this.title,
    required this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: MyTextStyle.titleStyle,
        ),
        TextButton(
            onPressed: function,
            child: const Text(
              "See all",
              style: MyTextStyle.seeAllButtonStyle,
            ))
      ],
    );
  }
}
