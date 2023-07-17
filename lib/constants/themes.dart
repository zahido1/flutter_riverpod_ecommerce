import 'package:flutter/material.dart';

const bannerColor = Color.fromARGB(255, 132, 54, 104);
const appBarColor = Color.fromARGB(255, 2, 34, 56);
const backgroundColor = Color.fromARGB(255, 246, 246, 246);
const productBgColor = Color.fromARGB(255, 244, 252, 254);

class MyTextStyle {
  static const bannerTitleStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final bannerDescStyle = TextStyle(
    fontSize: 12,
    color: Colors.grey.shade200,
  );

  static const titleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const seeAllButtonStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: bannerColor,
  );

  static const productTitleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
  );

  static const producDescriptiontyle = TextStyle(
    fontSize: 14,
    overflow: TextOverflow.ellipsis,
  );
}
