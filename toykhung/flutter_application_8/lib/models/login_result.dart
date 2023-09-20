// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    List<UserElement>? users;

    User({
        this.users,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        users: json["users"] == null ? [] : List<UserElement>.from(json["users"]!.map((x) => UserElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x.toJson())),
    };
}

class UserElement {
    int? id;
    String? email;
    String? password;

    UserElement({
        this.id,
        this.email,
        this.password,
    });

    factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
        id: json["id"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
    };
}
