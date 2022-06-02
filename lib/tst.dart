import 'dart:io';

import 'package:http/http.dart' as http;

void main() async {
  String baseUrl = "http://127.0.0.1:7000//api//register//";
  var response = await http
      .get(Uri.parse(baseUrl), headers: {"Access-Controll-Allow-Origin": "*"});
  print(response.body);
}
