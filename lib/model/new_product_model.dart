class NewProductModel {
  int productId;
  String title;
  String shortDescription;
  String description;
  double rating;
  int review;
  String imgUrl;
  int price;
  int categoryId;
  bool isSelected;
  int countInCart;

  NewProductModel({
    required this.productId,
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.rating,
    required this.review,
    required this.imgUrl,
    required this.price,
    required this.categoryId,
    this.isSelected = false,
    this.countInCart = 0,
  });
}
