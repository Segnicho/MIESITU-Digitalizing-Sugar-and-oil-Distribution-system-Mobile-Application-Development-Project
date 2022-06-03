// import 'package:dio/dio.dart';
// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
// import 'package:labpract/application/auth/events/auth_events.dart';
import 'package:labpract/domain/auth/entity/auth_model.dart';
import 'package:labpract/domain/auth/validation/invalid_validation.dart';
// import 'package:labpract/infra/auth/data_provider/auth_provider.dart';
// import 'package:labpract/domain/auth/entity/auth_model.dart';
// import 'package:labpract/domain/auth/validation/invalid_validation.dart';
// import 'package:labpract/infra/auth/data_provider/auth_provider.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Map<String, dynamic>? loginData;

class AuthRepository {
  static bool isadmin = false;
  // static final storage = FlutterSecureStorage();
  // final AuthDataProvider authDataProvider;

  // AuthRepository({required this.authDataProvider});
  static const mUrl = 'http://127.0.0.1:7000';

  // Future<Map<String, dynamic>> getUser() async {
  // return getUserFromLocal();
  // }

  Future<User> signIn(String email, String password) async {
    try {
      print(email);
      print(email.toString());

      Response response = await http.post(Uri.parse("$mUrl/api/login/"), body: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        var tokn = await http.post(Uri.parse("$mUrl/api/token/"),
            // body: jsonEncode(<String, String>{
            body: {
              "email": email,
              "password": password,
            });
        print("the status code is::  ${response.statusCode}");
        final token = jsonDecode(tokn.body);
        final decResponse = jsonDecode(response.body);
        if (decResponse["type"] == "admin") {
          print(decResponse["type"]);
          print("this is the admin");
          isadmin = true;
          return User.fromJson(decResponse);
        }
        return User.fromJson(decResponse);
      }

      throw InvalidCredential(failedValue: 'Could Not Fetch data.');
      // return await authDataProvider.loginUser(String email, String password);
    } catch (e) {
      throw InvalidCredential(failedValue: e.toString());
    }
  }

  // late RegisterEvent registerEvent;
  Future<bool> signUp(Register register) async {
    final response = await http.post(
      Uri.parse("$mUrl/api/register/"),
      body: {
        "username": register.username,
        "first_name": register.first_name,
        "last_name": register.last_name,
        "email": register.email,
        "password": register.password,
        "password2": register.password2,
      },
    );
    print("signUp response :: " + response.body);
    print(register.email);
    if (response.statusCode == 201) {
      print(response.body); //go to login page
      return true;
    } else {
      return false;
    }
    // final response = await authDataProvider.registerUser(register);
    // return response;
  }

  // static Future<bool> saveUserLocally(User user) async {
  //   try {
  //     await storage.write(key: "username", value: user.username);
  //     await storage.write(key: "first_name", value: user.first_name);
  //     await storage.write(key: "last_name", value: user.last_name);
  //     await storage.write(key: "email", value: user.email);
  //     await storage.write(key: "id", value: user.id);
  //     await storage.write(key: "password", value: user.password);
  //     return true;
  //   } catch (e) {
  //     throw e;
  //   }
  // }

  // Future<Map<String, dynamic>> getUserFromLocal() async {
  //   if (await storage.containsKey(key: 'token')) {
  //     String? token = await storage.read(key: 'token');
  //     String? username = await storage.read(key: 'username');
  //     String? first_name = await storage.read(key: 'first_name');
  //     String? last_name = await storage.read(key: 'last_name');
  //     String? id = await storage.read(key: 'id');
  //     String? password = await storage.read(key: 'password');

  //     return {
  //       '_id': id,
  //       'name': username,
  //       'first_name': first_name,
  //       'last_name': last_name,
  //       'token': token,
  //       'password': password
  //     };
  //   } else {
  //     return {};
  //   }
  // }
}
