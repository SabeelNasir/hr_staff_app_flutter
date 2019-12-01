import 'package:flutter/material.dart';
import '../screens/leaves/leaves.dart';
import '../screens/performance-stats/performance-stats.dart';
import '../helpers/Routes.dart';
import '../screens/home/home.dart';

class MainLayout extends StatefulWidget {
  final String appBarTitle;
  final Widget bodyWidget;
  MainLayout({this.appBarTitle, this.bodyWidget});
  @override
  State<StatefulWidget> createState() {
    return MainLayoutState();
  }
}

class MainLayoutState extends State<MainLayout> {
  String appBarTitle;
  Widget bodyWidget;
  List<Widget> pages;
  Widget currentPage;
  @override
  void initState() {
    appBarTitle = widget.appBarTitle;
    bodyWidget = widget.bodyWidget;
    pages = [Home('Sabeel', 'Url'), PerformanceStats(), Leaves()];
    currentPage = Home('Sabeel', 'Url');
    super.initState();
  }

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
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: bodyWidget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentNavItem,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.stars), title: Text('Performance')),
          BottomNavigationBarItem(
              icon: Icon(Icons.time_to_leave), title: Text('Leaves')),
        ],
        onTap: onTapBottomNavItem,
      ),
    ));
  }
}
