class UserModel {
  String userId;
  String name;
  String email;
  String picture;

  UserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.picture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      name: json['name'],
      email: json['email'],
      picture: json['picture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'picture': picture,
    };
  }
}
