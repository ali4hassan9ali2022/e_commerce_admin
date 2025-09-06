class UserModel {
  final String id;
  final String name;
  final String image;
  final String email;
  final String password;
  final String confirePassword;
  final List userCart;
  final List userWish;
  final DateTime createIt;
  final bool isAdmin;

  UserModel({
    required this.id,
    required this.name,
    required this.image,
    required this.email,
    required this.password,
    required this.confirePassword,
    required this.userCart,
    required this.userWish,
    required this.createIt,
    required this.isAdmin
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      email: json["email"],
      password: json["password"],
      confirePassword: json["confirePassword"],
      userCart: json["userCart"],
      userWish: json["userWish"],
      createIt: DateTime.parse(json["createIt"]),
      isAdmin: json["isAdmin"]
    );
  }
  toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "email": email,
      "password": password,
      "confirePassword": confirePassword,
      "userCart": userCart,
      "userWish": userWish,
      "createIt": createIt.toIso8601String(),
      "isAdmin": isAdmin
    };
  }

  factory UserModel.empty() {
    return UserModel(
      id: "",
      name: "",
      email: "",
      confirePassword: "",
      image: "",
      password: "",
      userCart: [],
      userWish: [],
      createIt: DateTime.now(),
      isAdmin: false,
    );
  }
}
