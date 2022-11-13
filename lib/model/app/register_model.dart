class RegisterModel {
  RegisterModel({
    this.data,
  });

  Data data;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.insertUsers,
  });

  InsertUsers insertUsers;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    insertUsers: InsertUsers.fromJson(json["insert_user"]),
  );

  Map<String, dynamic> toJson() => {
    "insert_user": insertUsers.toJson(),
  };
}

class InsertUsers {
  InsertUsers({
    this.returning,
  });

  List<Returning> returning;

  factory InsertUsers.fromJson(Map<String, dynamic> json) => InsertUsers(
    returning: List<Returning>.from(json["returning"].map((x) => Returning.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "returning": List<dynamic>.from(returning.map((x) => x.toJson())),
  };
}

class Returning {
  Returning({
    this.id,
    this.fullname,
    this.username,
    this.email,
    this.password,
    this.tglDaftar,
  });

  int id;
  String fullname;
  String username;
  String email;
  String password;
  DateTime tglDaftar;

  factory Returning.fromJson(Map<String, dynamic> json) => Returning(
    id: json["id"],
    fullname: json["fullname"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
    tglDaftar: DateTime.parse(json["tgl_daftar"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullname": fullname,
    "username": username,
    "email": email,
    "password": password,
    "tgl_daftar": "${tglDaftar.year.toString().padLeft(4, '0')}-${tglDaftar.month.toString().padLeft(2, '0')}-${tglDaftar.day.toString().padLeft(2, '0')}",
  };
}
