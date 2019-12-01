import 'package:flutter/material.dart';
import 'package:hr_staff_app_flutter/screens/user/profile.dart';
import '../home/popup-menu-button.dart';
import '../user/profile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../layouts/DrawerLayout.dart';
import '../leaves/leaves.dart';
import '../performance-stats/performance-stats.dart';
import '../../helpers/Routes.dart';
import 'package:localstorage/localstorage.dart';

class Home extends StatefulWidget {
  final String employeeName;
  final String empImageUrl;
  Home(this.employeeName, this.empImageUrl);
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  static String empImageUrl;
  static String employeeName;
  List<Widget> pages;
  Widget currentPage;
  final LocalStorage localStorage = LocalStorage('flutter-key');
  @override
  void initState() {
    empImageUrl = widget.empImageUrl;
    employeeName = widget.employeeName;
    pages = [Home(employeeName, empImageUrl), PerformanceStats(), Leaves()];
    currentPage = Home(employeeName, empImageUrl);
    super.initState();
  }

  @override
  void didUpdateWidget(Home oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  //Create widget-elements here //
  final cardWidget = Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(FontAwesomeIcons.clock),
          title: Text('Attendance'),
          trailing: Text('02,Dec 2019'),
        ),
        Container(
          height: 250,
          width: 200,
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 200,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Checked In',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '09:45 AM',
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );

  int currentNavItem = 0;
  //onTab BottomNavigationbar Item
  void onTapBottomNavItem(int index) {
    switch (index) {
      case 0:
        Routes().route(context, 'home');
        break;
      case 1:
        Routes().route(context, 'performance-stats');
        break;
      case 2:
        Routes().route(context, 'leaves');
        break;
    }
    setState(() {
      currentNavItem = index;
      currentPage = pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: localStorage.ready,
        builder: (BuildContext context, snapshot) {
          return MaterialApp(
            title: 'HrStaff Portal',
            theme: ThemeData(primarySwatch: Colors.blue),
            home: Scaffold(
              appBar: AppBar(
                //leading: Image.asset('assets/images/olive-logo.png'),
                title: Text('Home'),
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    icon: CircleAvatar(
                      backgroundImage:
                          NetworkImage(localStorage.getItem('empImageUrl')),
                      radius: 30,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    },
                    iconSize: 40,
                  ),
                  WidgetPopupmenuButton().getWidget(context),
                ],
              ),
              body: Column(
                children: <Widget>[cardWidget],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: currentNavItem,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), title: Text('Home')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.stars), title: Text('Performance')),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.time_to_leave), title: Text('Leaves')),
                ],
                onTap: onTapBottomNavItem,
              ),
              drawer: DrawerLayout(),
            ),
          );
        });
  }
}
