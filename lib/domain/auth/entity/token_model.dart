class Token {
  String? accesstoken;
  String? refeshtoken;

  Token({this.accesstoken, this.refeshtoken});
  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
        accesstoken: json['accesstoken'], refeshtoken: json['refreshtoken']);
  }
}
