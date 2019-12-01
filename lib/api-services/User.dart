import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../helpers/Routes.dart';

class User {
  String token;
  String employeeName;
  String employeeImage;
  int tTL;
  User({this.token, this.employeeName, this.employeeImage, this.tTL});
  factory User.fromJson(Map<String, dynamic> json) {
    json = json['data'];
    return User(
        token: json['token'],
        employeeName: json['employeeName'],
        employeeImage: json['employeeImage'],
        tTL: json['TTL']);
  }

  Map mapSendBody(username, password) {
    var map = new Map<String, dynamic>();
    map["username"] = username;
    map["password"] = password;
    return map;
  }

  //Post Login
  Future<User> sendLoginUserRequest(String username, String password) async {
    try {
      Map body = mapSendBody(username, password);
      var json = jsonEncode(body);
      final response = await http.post(
          'https://olive-emreports-aws-node.olivecliq.com/api/authenticate',
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
          body: json);
      if (response.statusCode == 200) {
        var userData = User.fromJson(jsonDecode(response.body));
        //var refs = await SharedPreferences.getInstance();
        //refs.setString('token',userData.token);
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
