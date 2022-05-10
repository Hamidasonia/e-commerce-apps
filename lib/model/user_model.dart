class UserModel {
  UserModel({
    this.name,
    this.email,
    this.phone,
    this.token,
    this.isVerified,
    this.avatarUrl,
  });

  String name;
  String email;
  String phone;
  String token;
  bool isVerified;
  String avatarUrl;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    token: json["token"],
    isVerified: json["is_verified"],
    avatarUrl: json["avatar_url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "token": token,
    "is_verified": isVerified,
    "avatar_url": avatarUrl,
  };
}
