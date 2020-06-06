class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String apiToken;

  User(this.firstName, this.lastName, this.email, [this.apiToken, this.id]);

  User.fromJson(Map<String, dynamic> jsonObject) {
    this.id = jsonObject['user_id'];
    this.firstName = jsonObject['first_name'];
    this.lastName = jsonObject['last_email'];
    this.email = jsonObject['email'];
    this.apiToken = jsonObject['email'];
  }
}
