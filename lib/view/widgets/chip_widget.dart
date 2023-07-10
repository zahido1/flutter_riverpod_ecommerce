import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const ChipWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {
          debugPrint("Chip tapped");
        },
        child: Chip(
          label: Text(title),
          avatar: Icon(icon),
          backgroundColor: Colors.transparent,
          elevation: 1,
        ),
      ),
    );
  }
}
