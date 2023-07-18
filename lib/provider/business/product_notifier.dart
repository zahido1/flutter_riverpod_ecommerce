import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ecommerce/data/product.dart';
import 'package:flutter_riverpod_ecommerce/model/new_product_model.dart';

class ProductNotifierManager extends StateNotifier<List<NewProductModel>> {
  ProductNotifierManager() : super(newProducts);

  void toggleSelected(int id) {
    state = [
      for (final product in state)
        if (product.productId == id)
          NewProductModel(
            categoryId: product.categoryId,
            description: product.description,
            imgUrl: product.imgUrl,
            price: product.price,
            productId: product.productId,
            rating: product.rating,
            review: product.review,
            shortDescription: product.shortDescription,
            title: product.title,
            isSelected: !product.isSelected,
          )
        else
          product,
    ];
  }
}

class CartNotifierManager extends StateNotifier<List<NewProductModel>> {
  CartNotifierManager() : super([]);
  void addToCart(NewProductModel product) {
    state = [
      ...state,
      NewProductModel(
          productId: product.productId,
          title: product.title,
          shortDescription: product.shortDescription,
          description: product.description,
          rating: product.rating,
          review: product.review,
          imgUrl: product.imgUrl,
          price: product.price,
          categoryId: product.categoryId,
          countInCart: 1),
    ];
  }

  void deleteFromCart(int id) {
    state = [
      for (final product in state)
        if (product.productId != id) product,
    ];
  }

  void increment(int id) {
    state = [
      for (final product in state)
        if (product.productId != id)
          product
        else
          NewProductModel(
              productId: product.productId,
              title: product.title,
              shortDescription: product.shortDescription,
              description: product.description,
              rating: product.rating,
              review: product.review,
              imgUrl: product.imgUrl,
              price: product.price,
              categoryId: product.categoryId,
              countInCart: ++product.countInCart),
    ];
  }

  void decrement(int id) {
    state = [
      for (final product in state)
        if (product.productId != id)
          product
        else
          NewProductModel(
              productId: product.productId,
              title: product.title,
              shortDescription: product.shortDescription,
              description: product.description,
              rating: product.rating,
              review: product.review,
              imgUrl: product.imgUrl,
              price: product.price,
              categoryId: product.categoryId,
              countInCart: --product.countInCart),
    ];
  }
}
