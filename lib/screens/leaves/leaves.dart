import 'package:flutter/material.dart';
import '../../layouts/main-layout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../api-services/leaves.service.dart';
import '../../models/leaves.model.dart';

class Leaves extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LeavesState();
  }
}

class _LeavesState extends State<Leaves> {
  Future<List<LeavesModel>> availedLeaves;
  @override
  void initState() {
    availedLeaves = LeavesService().getAvailedLeaves();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBarTitle: 'Leaves',
      bodyWidget: ListView(
        children: <Widget>[
          FutureBuilder<List<LeavesModel>>(
              future: availedLeaves,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data
                        .map(
                          (row) => Card(
                            margin:
                                EdgeInsets.only(left: 8, right: 8, bottom: 5),
                            child: ListTile(
                              onTap: () {},
                              leading: Icon(Icons.person),
                              title: Text('asdff'),
                              trailing: Text('asdfsdf'),
                              subtitle: Text('gfsfsdfsdfsdf'),
                            ),
                          ),
                        )
                        .toList(),
                  );
                }
                return CircularProgressIndicator();
              }),
        ],
      ),
    );
  }
  // else if (snapshot.hasError) {
  //   return Center(
  //     child: Text(
  //       'Error : ${snapshot.error.toString()}',
  //       style: TextStyle(color: Colors.red),
  //     ),
  //   );
  // }

  // _read() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'employeeID';
  //   final value = prefs.getInt(key);
  //   print(value);
  // }

  // _save() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final key = 'employeeID';
  //   final value = 2021;
  //   final isSaved = await prefs.setInt(key, value);
  //   if (isSaved) {
  //     print('saved $value');
  //   }
  // }
}
