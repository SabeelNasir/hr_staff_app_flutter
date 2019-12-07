import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:hr_staff_app_flutter/models/user.model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../helpers/Routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  //Post Login
  Future<UserModel> sendLoginUserRequest(
      String username, String password) async {
    try {
      Map body = UserModel().mapSendBody(username, password);
      var json = jsonEncode(body);
      final response = await http.post(
          //'https://olive-emreports-aws-node.olivecliq.com/api/authenticate',
          'http://192.168.1.12:3003/api/authenticate',
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
          body: json);
      if (response.statusCode == 200) {
        var userData = UserModel.fromJson(jsonDecode(response.body));
        (await SharedPreferences.getInstance())
            .setString('token', userData.token);
        (await SharedPreferences.getInstance())
            .setString('employeeImageName', userData.employeeImageName);
        (await SharedPreferences.getInstance())
            .setString('employeeImageUrl', userData.employeeImage);
        return userData;
      } else {
        throw Exception(jsonDecode(response.body));
      }
    } catch (error) {
      throw Exception('ErrorOccured : ' + error);
    }
  }

  //Logout
  void logout(BuildContext context) {
    Routes().route(context, 'login');
  }
}
