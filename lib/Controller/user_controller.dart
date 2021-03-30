import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cursoweb/Model/user_model.dart';
import 'package:http/http.dart' as http;

class UserController {
  Future<bool> login(UserModel user) async {
    var baseURL = Uri.parse('http://localhost:4000/api/users/login');
    print('Valor informado -> Email: ${user.email} Senha: ${user.password}');
    final response = await http
        .post(baseURL, body: {'email': user.email, 'password': user.password});
    print('Response -> ${response.statusCode}');
    if (response.statusCode == 200) {
      return true;
    } else if ((response.statusCode == 401) || (response.statusCode == 404)) {
      return false;
    }
    return null;
  }
}
