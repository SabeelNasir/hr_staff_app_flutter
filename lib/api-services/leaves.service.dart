import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:hr_staff_app_flutter/models/leaves.model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../helpers/Routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LeavesService {
  Future<List<LeavesModel>> getAvailedLeaves() async {
    List<LeavesModel> availedLeaves;
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    try {
      final response = await http
          .get('http://192.168.1.12:3003/api/availed-leaves', headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader:
            "Bearer " + sharedPrefs.getString('token')
      });
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var dataList = data as List;
        availedLeaves = dataList
            .map<LeavesModel>((json) => LeavesModel.fromJson(json))
            .toList();
        return availedLeaves;
      } else {
        print(response.body);
        return null;
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
