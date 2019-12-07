import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../helpers/Routes.dart';
import 'package:localstorage/localstorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerLayout extends StatelessWidget {
  final LocalStorage localStorage = LocalStorage('flutter-key');
  SharedPreferences sharedPrefs;
  Future<dynamic> setFutures() async {
    sharedPrefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    String employeeName = localStorage.getItem('empName');
    String empImageUrl = localStorage.getItem('empImageUrl');
    return FutureBuilder(
        future: setFutures(),
        builder: (BuildContext context, snapshot) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  duration: Duration(milliseconds: 3000),
                  child: Column(children: <Widget>[
                    SizedBox(
                      width: 70,
                      height: 50,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('$empImageUrl'),
                        radius: 30,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '$employeeName',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Software Developer',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                  ]),
                  decoration: BoxDecoration(color: Colors.blue),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('User Profile'),
                  onTap: () {
                    Navigator.pop(context);
                    Routes().route(context, 'profile');
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.calendar),
                  title: Text('Leaves'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Routes().route(context, 'leaves');
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.sortNumericUp),
                  title: Text('Performance Stats'),
                  onTap: () {
                    Navigator.pop(context);
                    Routes().route(context, 'performance-stats');
                  },
                ),
              ],
            ),
          );
        });
  }
}
