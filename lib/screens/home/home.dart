import 'package:flutter/material.dart';
import 'package:hr_staff_app_flutter/screens/user/profile.dart';
import '../home/popup-menu-button.dart';
import '../user/profile.dart';
import '../../layouts/DrawerLayout.dart';
import '../leaves/leaves.dart';
import '../performance-stats/performance-stats.dart';
import '../../helpers/Routes.dart';
import 'package:localstorage/localstorage.dart';
import '../home/home_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<Widget> pages;
  Widget currentPage;
  final LocalStorage localStorage = LocalStorage('flutter-key');
  SharedPreferences sharedPrefs;
  @override
  void initState() {
    pages = [Home(), PerformanceStats(), Leaves()];
    currentPage = Home();
    super.initState();
  }

  @override
  void didUpdateWidget(Home oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  //Create widget-elements here //
  final cardWidget = HomeCard();

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

  Future setFutures() async {
    sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: setFutures(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData == null) {
            return MaterialApp(
                title: 'HrStaff Portal',
                theme: ThemeData(primarySwatch: Colors.blue),
                home: Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ));
          }
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
                          //NetworkImage(localStorage.getItem('empImageUrl')),
                          NetworkImage(
                              sharedPrefs.getString('employeeImageUrl')),
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
