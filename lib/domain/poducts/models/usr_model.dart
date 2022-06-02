import 'dart:convert';

RegUser regUserFromJson(String str) => RegUser.fromJson(json.decode(str));
String regUserToJson(RegUser data) => json.encode(data.toJson());

class RegUser {
    RegUser({
        required this.username,
        this.firstName,
        this.lastName,
       required this.email,
        this.custImg,
    });

    String username;
    String? firstName;
    String? lastName;
    String email;
    dynamic? custImg;

    factory RegUser.fromJson(Map<String, dynamic> json) => RegUser(
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        custImg: json["cust_img"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "cust_img": custImg,
    };
}
