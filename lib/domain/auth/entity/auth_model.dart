abstract class Authentication {}

class Register extends Authentication {
  final String username;

  final String email;

  final String password;

  final String password2;

  // ignore: non_constant_identifier_names
  final String first_name;

  // ignore: non_constant_identifier_names
  final String last_name;

  Register({
    required this.username,
    required this.email,
    required this.password,
    required this.password2,
    // ignore: non_constant_identifier_names
    required this.first_name,
    // ignore: non_constant_identifier_names
    required this.last_name,
  });

  List<Object> get props =>
      [username, email, first_name, last_name, password, password2];

  @override
  String toString() =>
      '{"username": "$username", "email": "$email", "password2": "$password2","password": "$password", "first_name":"$first_name", "last_name":"$last_name"}';
}

class Login extends Authentication {
  final String email;

  final String password;

  Login({required this.email, required this.password});
}

User? currentUser;

class User extends Authentication {
  final String? id;
  final String? type;
  final String username;

  final String? accesstoken;
  final String? token;

  final String email;

  // final List<dynamic> roles;

  // final String avatar;

  final String? password;

  final String? firstname;

  final String? lastname;
  final String? refreshtoken;

  User({
    this.type,
    this.token,
    this.id,
    required this.username,
    this.accesstoken,
    required this.email,
    this.password,
    this.firstname,
    this.lastname,
    this.refreshtoken,
  });
  //  :

  // this.avatar =
  // "https://avatars.dicebear.com/api/personas/your-custom-seed.svg";

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      // id: json['id'],
      type: json["type"],
      refreshtoken: json["refreshtoken"],
      token: json["token"],
      accesstoken: json["accesstoken"],
      username: json["username"],
      firstname: json['"firstname"'],
      lastname: json['"lastname"'],
      email: json["email"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toDBjson() => {
        "accesstoken": accesstoken,
        "refreshtoken": refreshtoken,
        "firstname": firstname,
        "type": type,
        "lastname": lastname,
        "username": username,
        "email": email
      };
}
