class UserModel {
  final String username, email, password, imageUrl , uid;

  UserModel(
      {required this.username,
      required this.email,
      required this.password,
      required this.imageUrl,
      required this.uid});
  UserModel.fromJson(Map<String, dynamic> json)
      : this.username = json["username"],
        this.password = json["password"],
        this.imageUrl = json["imageUrl"],
        this.email = json["email"],
        this.uid = json["uid"];
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "passowrd": password,
      "imageUrl": imageUrl,
      "username": username
    };
  }
}
