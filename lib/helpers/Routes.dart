import 'package:flutter/material.dart';
import '../auth/login-page.dart';
import '../screens/user/profile.dart';
import '../screens/leaves/leaves.dart';
import '../screens/performance-stats/performance-stats.dart';
import '../screens/home/home.dart';

class Routes {
  //central routes Navigator
  void route(BuildContext context, String page) {
    switch (page) {
      case 'home':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home('Sabeel', 'Url')),
        );
        break;
      case 'profile':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Profile()),
        );
        break;
      case 'login':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
        break;
      case 'leaves':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Leaves()),
        );
        break;
      case 'performance-stats':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PerformanceStats()),
        );
        break;
    }
  }
}
