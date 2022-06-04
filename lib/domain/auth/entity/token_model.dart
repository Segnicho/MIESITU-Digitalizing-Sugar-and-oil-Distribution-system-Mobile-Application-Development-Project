class Token {
  String? accesstoken;
  String? refeshtoken;

  Token({this.accesstoken, this.refeshtoken});
  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
        accesstoken: json['access'], refeshtoken: json['refresh']);
  }
}