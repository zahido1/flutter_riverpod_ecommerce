// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  List<Product> products;

  ProductModel({
    required this.products,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  int productId;
  String title;
  String shortDescription;
  String description;
  double rating;
  int review;
  String imgUrl;
  int price;

  Product({
    required this.productId,
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.rating,
    required this.review,
    required this.imgUrl,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        title: json["title"],
        shortDescription: json["shortDescription"],
        description: json["description"],
        rating: json["rating"]?.toDouble(),
        review: json["review"],
        imgUrl: json["imgUrl"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "title": title,
        "shortDescription": shortDescription,
        "description": description,
        "rating": rating,
        "review": review,
        "imgUrl": imgUrl,
        "price": price,
      };
}
