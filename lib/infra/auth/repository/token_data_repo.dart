import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:labpract/domain/auth/entity/token_model.dart';

const baseUrl = "https://127.0.0.1:7000/";

Future<Token> getToken(String email, String password) async {
  final http.Response response = await http.post(
    Uri.parse('$baseUrl/api/auth/'),
    body: {"email": email, password: password},
  );
  if (response.statusCode == 200) {
    return Token.fromJson(json.decode(response.body));
  } else {
    throw Exception(json.decode(response.body));
  }
}
