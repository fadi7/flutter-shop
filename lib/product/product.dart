import '../review/Review.dart';
import '../category/category.dart';
import '../product/tag.dart';
import '../product/product_unit.dart';

class Product {
  int id;
  String title;
  String description;
  ProductUnit productUnit;
  double price;
  double discount;
  double total;
  Category productCategory;
  List<Tag> productTags;
  List<String> images;
  List<Review> reviews;

  Product(
      this.id,
      this.title,
      this.description,
      this.productUnit,
      this.price,
      this.discount,
      this.total,
      this.productCategory,
      this.productTags,
      this.images,
      this.reviews);

  Product.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['product_id'];
    this.title = jsonObject['product_title'];
    this.description = jsonObject['product_desciption'];
    this.price = double.tryParse(jsonObject['product_price']);
    this.discount = double.tryParse(jsonObject['product_discount']);
    this.total = double.tryParse(jsonObject['product_total']);
    this.productCategory = Category.fromJson(jsonObject['product_category']);
    this.productUnit = ProductUnit.fromJson(jsonObject['product_unit']);
    _setImages(jsonObject['product_images']);
    _setTags(jsonObject['product_tags']);
    _setReviews(jsonObject['product_reviews']);
  }

  void _setTags(List<dynamic> jsonTags) {
    this.productTags = [];
    if (jsonTags.length > 0)
      for (var tag in jsonTags) {
        productTags.add(Tag.fromJson(tag));
      }
  }

  void _setReviews(List<dynamic> jsonReviews) {
    this.reviews = [];
    if (jsonReviews.length > 0)
      for (var review in jsonReviews) {
        reviews.add(Review.fromJson(review));
      }
  }

  void _setImages(List<dynamic> jsonimages) {
    images = [];
    if (jsonimages.length > 0)
      for (var image in jsonimages) {
        this.images.add(image['image_url']);
      }
  }
}
