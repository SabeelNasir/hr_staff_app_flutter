import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  void didUpdateWidget(Leaves oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              title: Text('Availed Leaves'),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context)),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(text: 'Pending'),
                  Tab(text: 'Approved'),
                ],
              )),
          body: TabBarView(
            children: <Widget>[
              ListView(
                children: <Widget>[],
              ),
              ListView(
                children: <Widget>[
                  FutureBuilder<List<LeavesModel>>(
                      future: availedLeaves,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: snapshot.data
                                .map(
                                  (row) => Card(
                                    margin: EdgeInsets.only(
                                        left: 8, right: 8, bottom: 5),
                                    child: Column(
                                      children: <Widget>[
                                        ListTile(
                                          onTap: () {},
                                          leading: Icon(
                                            Icons.person,
                                            color: Colors.blue,
                                          ),
                                          trailing: Text(
                                           (row.leaveDays > 0) ?  row.leaveDays.toString()+' Days' : ''
                                          ),
                                          title: Text(row.leaveName),
                                          subtitle: Text(
                                              '${row.leaveFromDate} to ${row.leaveToDate}'),
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 23.0, bottom: 8),
                                                child:
                                                    Text('${row.description}'),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          );
                        }
                        return Container(
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 170,
                              ),
                              Padding(
                                padding: EdgeInsets.all(50.0),
                                child: CircularProgressIndicator(
                                  strokeWidth: 1.0,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
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
