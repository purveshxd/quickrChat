// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.friends,
    required this.userdata,
  });

  List<String> friends;
  Userdata userdata;

  UserModel copyWith({
    List<String>? friends,
    Userdata? userdata,
  }) =>
      UserModel(
        friends: friends ?? this.friends,
        userdata: userdata ?? this.userdata,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        friends: List<String>.from(json["friends"].map((x) => x)),
        userdata: Userdata.fromJson(json["userdata"]),
      );

  Map<String, dynamic> toJson() => {
        "friends": List<dynamic>.from(friends.map((x) => x)),
        "userdata": userdata.toJson(),
      };
}

class Userdata {
  Userdata({
    required this.userEmail,
    required this.userId,
    required this.userName,
  });

  String userEmail;
  String userId;
  String userName;

  Userdata copyWith({
    String? userEmail,
    String? userId,
    String? userName,
  }) =>
      Userdata(
        userEmail: userEmail ?? this.userEmail,
        userId: userId ?? this.userId,
        userName: userName ?? this.userName,
      );

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
        userEmail: json["userEmail"],
        userId: json["userId"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "userEmail": userEmail,
        "userId": userId,
        "userName": userName,
      };
}
