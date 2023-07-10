import 'package:flutter_riverpod/flutter_riverpod.dart';

final bannerTitle = Provider<String>((ref) {
  return "Apple Store";
});

final bannerDesc = Provider<String>((ref) {
  return "Find the Apple product andaccessories you’re looking for";
});
