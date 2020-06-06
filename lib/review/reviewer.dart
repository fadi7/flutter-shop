class Reviewer {
  String firstName, lastName, email;

  Reviewer(this.firstName, this.lastName, this.email);

  Reviewer.fromJson(Map<String, dynamic> jsonObject) {
    this.firstName = jsonObject['first_name'];
    this.lastName = jsonObject['last_name'];
    this.email = jsonObject['email'];
  }
}
