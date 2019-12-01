import 'package:flutter/material.dart';
import '../../layouts/main-layout.dart';

class PerformanceStats extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PerformanceStats();
  }
}

class _PerformanceStats extends State<PerformanceStats> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBarTitle: 'Performance Stats',
      bodyWidget: null,
    );
  }
}
