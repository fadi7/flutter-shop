import './reviewer.dart';

class Review {
  int id;
  int stars;
  String review;
  Reviewer reviewer;

  Review(this.id, this.stars, this.review, this.reviewer);

  Review.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['review_id'];
    this.stars = jsonObject['stars'];
    this.review = jsonObject['review'];
    this.reviewer = Reviewer.fromJson(jsonObject['reviewer']);
  }
}
